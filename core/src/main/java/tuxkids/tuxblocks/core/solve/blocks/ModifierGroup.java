package tuxkids.tuxblocks.core.solve.blocks;

import java.util.ArrayList;
import java.util.List;

import playn.core.GroupLayer;
import playn.core.Layer;
import playn.core.util.Clock;
import pythagoras.f.Rectangle;
import tuxkids.tuxblocks.core.solve.blocks.SimplifyLayer.Simplifiable;
import tuxkids.tuxblocks.core.solve.markup.Renderer;
import tuxkids.tuxblocks.core.utils.HashCode;
import tuxkids.tuxblocks.core.utils.HashCode.Hashable;

public abstract class ModifierGroup extends Sprite implements Hashable, Simplifiable {

	protected final static int MODIFIERS_DEPTH = 0;
	protected static final int CHILD_START_DEPTH = -1;
	
	protected abstract void updateChildren(float base, float dt);
	protected abstract void updateRect();
	protected abstract ModifierGroup createModifiers();
	protected abstract boolean canAdd(ModifierBlock sprite);
	protected abstract Renderer createRenderer(Renderer base);
	
	public abstract void addNegative();
	
	protected GroupLayer layer;
	protected Rectangle rect = new Rectangle();
	protected Rectangle parentRect = new Rectangle(); 
	protected boolean multiExpression;
	protected SimplifyLayer simplifyLayer;

	private List<ModifierBlock> toRemove = new ArrayList<ModifierBlock>();
	
	protected List<ModifierBlock> children = new ArrayList<ModifierBlock>(),
			destroying = new ArrayList<ModifierBlock>();
	protected ModifierGroup modifiers;
	
	@Override
	public Layer layer() {
		return layer;
	}

	@Override
	public float x() {
		return rect.x;
	}
	
	@Override
	public float y() {
		return rect.y();
	}
	
	@Override
	public float width() {
		return rect.width;
	}

	@Override
	public float height() {
		return rect.height;
	}
	
	public float totalWidth() {
		if (modifiers == null) {
			return width();
		}
		return modifiers.totalWidth();
	}

	public float offsetX() {
		if (modifiers == null) {
			return rect.x;
		}
		return modifiers.offsetX();
	}
	
	@Override
	public void initSpriteImpl() {
		super.initSpriteImpl();

		layer = graphics().createGroupLayer();
		int index = 0;
		for (ModifierBlock child : children) {
			child.initSprite();
			addChildSprite(child, index++);
		}
		updateRect();
		updateChildren(0, 1);
		if (modifiers != null) {
			modifiers.updateParentRect(this);
			modifiers.initSprite();
			addModifiersSprite();
		}
		
		simplifyLayer = new SimplifyLayer(this);
		layer.add(simplifyLayer.layerAddable());
		simplifyLayer.setDepth(SIMPLIFY_DEPTH);
	}
	
	@Override
	public void destroy() {
		if (hasSprite()) layer().destroy();
		for (ModifierBlock child : children) {
			child.destroy();
		}
		if (modifiers != null) modifiers.destroy();
	}
	
	protected void addNewModifiers() {
		if (modifiers != null) return;
		setModifiers(createModifiers());
	}
	
	protected ModifierGroup removeModifiers() {
		ModifierGroup mods = modifiers;
		if (modifiers != null && hasSprite()) layer.remove(modifiers.layer());
		modifiers = null;
		return mods;
	}
	
	protected void setModifiers(ModifierGroup mods) {
		removeModifiers();
		modifiers = mods;
		if (mods != null && hasSprite()) {
			mods.initSprite();
			addModifiersSprite();
		}
	}
	
	protected void addModifiersSprite() {
		if (modifiers != null) {
			layer.add(modifiers.layer());
			modifiers.layer().setDepth(MODIFIERS_DEPTH);
			modifiers.addBlockListener(blockListener);
		}
		
	}

	protected ModifierBlock removeChild(ModifierBlock sprite) {
		for (int i = 0; i < children.size(); i++) {
			if (children.get(i) == sprite) {
				ModifierBlock child = children.remove(i);
				child.group = null;
				return child; // make sure it's the exact sprite and not just .equal()
			}
		}
		return null;
	}
	
	protected ModifierBlock removeChild(ModifierBlock sprite, boolean destroy) {
		ModifierBlock child = removeChild(sprite);
		if (destroy) {
			destroying.add(child);
		}
		return child;
	}

	protected void addChild(ModifierBlock child) {
		children.add(child);
		child.group = this;	
		if (hasSprite()) addChildSprite(child, children.size() - 1);
		child.addBlockListener(blockListener);
	}
	
	protected void addChildSprite(ModifierBlock child, int index) {
		float depth = CHILD_START_DEPTH - index;
		child.initSprite();
		layer.add(child.layer());
		child.layer().setVisible(true);
		child.layer().setDepth(depth);
	}
	
	public boolean isModifiedHorizontally() {
		if (modifiers == null) return false;
		if (modifiers.children.size() > 0 && modifiers instanceof HorizontalModifierGroup) return true;
		return modifiers.isModifiedHorizontally();
	}
	
	public boolean isModifiedVertically() {
		if (modifiers == null) return false;
		if (modifiers.children.size() > 0 && modifiers instanceof VerticalModifierGroup) return true;
		return modifiers.isModifiedVertically();
	}
	
	protected void addVerticalModifiersTo(List<VerticalModifierBlock> mods) {
		if (modifiers == null) return;
		for (ModifierBlock mod : modifiers.children) {
			if (mod instanceof VerticalModifierBlock) {
				mods.add((VerticalModifierBlock) mod);
			} else {
				break;
			}
		}
		modifiers.addVerticalModifiersTo(mods);
		
	}
	
	@Override
	public boolean contains(float x, float y) {
		if (super.contains(x, y)) return true;
		if (modifiers != null) return modifiers.contains(x, y);
		return false;
	}
	
	protected void updateParentRect(Sprite parent) {
		updateParentRect(parent.x(), parent.y(), parent.width(), parent.height());
	}
	
	protected void updateParentRect(float x, float y, float width, float height) {
		parentRect.setBounds(x, y, width, height);
	}

	public void snapChildren() {
		updateRect();
		updateChildren(0, 1);
		if (modifiers != null) {
			modifiers.updateParentRect(this);
			modifiers.snapChildren();
		}
	}
	
	@Override
	public void addBlockListener(BlockListener listener) {
		this.blockListener = listener;
		for (ModifierBlock child : children) {
			child.addBlockListener(listener);
		}
		if (modifiers != null) {
			modifiers.addBlockListener(listener);
		}
	}
	
	protected ModifierGroup updateParentModifiers() {
		if (children.size() == 0 && destroying.size() == 0) {
			if (modifiers == null) {
				return null;
			} else if (modifiers.children.size() == 0) {
				if (modifiers.modifiers == null) {
					return null;
				}
				releaseLayers();
				modifiers.releaseLayers();
				return modifiers.modifiers;
			}
		}
		return this;
	}
	
	private void updateModifiers() {
		if (modifiers != null && modifiers.children.size() == 0 && modifiers.modifiers != null) {
			layer.remove(modifiers.layer());
			for (ModifierBlock child : modifiers.modifiers.children) {
				toRemove.add(child);
			}
			for (ModifierBlock child : toRemove) {
				modifiers.modifiers.removeChild(child);
				addChild(child);
			}
			toRemove.clear();
			modifiers = modifiers.modifiers.modifiers;
			if (modifiers != null) {
				layer.add(modifiers.layer());
			}
		}
	}
	
	protected void releaseLayers() {
		layer.remove(modifiers.layer());
	}
	
	protected ModifierBlock addModifier(ModifierBlock sprite, boolean snap) {
		if (modifiers == null && canAdd(sprite)) {
			addChild(sprite);
			if (snap) {
				updateRect();
				if (hasSprite()) updateChildren(0, 1);
			}
		} else {
			if (modifiers == null) addNewModifiers();
			if (snap) {
				updateRect();
			}
			modifiers.updateParentRect(this);
			modifiers.addModifier(sprite, snap);
		}
		return sprite;
	}

	public ModifierBlock addExpression(NumberBlock sprite, boolean snap) {
		if (modifiers != null) {
			return modifiers.addExpression(sprite, snap);
		}
		return null;
	}
	
	public boolean canAddExpression(NumberBlock sprite) {
		if (modifiers != null) {
			return modifiers.canAddExpression(sprite);
		}
		return false;
	}
	
	@Override
	public void update(int delta) {
		for (int i = 0; i < children.size(); i++) {
			ModifierBlock sprite = children.get(i);
			if (sprite.group() != this) {
				removeChild(sprite); 
				i--;
			} else {
				sprite.update(delta, multiExpression);
			}
		}
		
		
		for (int i = 0; i < destroying.size(); i++) {
			ModifierBlock sprite = destroying.get(i);
			if (sprite.layer().alpha() == 0) {
				sprite.destroy();
				destroying.remove(i--);
			}
		}
		
		if (modifiers != null) {
			modifiers.update(delta, multiExpression);
			ModifierGroup newMods = modifiers.updateParentModifiers();
			if (newMods != modifiers) {
				if (newMods != null) {
					layer.add(newMods.layer());
				}
				modifiers.layer().destroy();
				modifiers = newMods;
			}
		}
		updateModifiers();
		if (simplifyLayer != null) {
			simplifyLayer.update();
		}
	}
	
	public void update(int delta, boolean multiExpression) {
		this.multiExpression = multiExpression;
		update(delta);
	}

	@Override
	public void paint(Clock clock) {
		updateRect();
		updateChildren(lerpBase(), clock.dt());
		for (ModifierBlock sprite : children) {
			sprite.paint(clock);
		}
		for (ModifierBlock sprite : destroying) {
			sprite.layer().setAlpha(lerpTime(sprite.layer().alpha(), 0, 0.995f, clock.dt(), 0.01f));
//			sprite.paint(clock);
		}
		if (modifiers != null) {
			modifiers.updateParentRect(this);
			modifiers.paint(clock);
		}
	}
	
	public void simplifyModifiers() {
		if (modifiers != null) modifiers.simplifyModifiers();
	}
	
	@Override
	protected void performAction(Action action) {
		super.performAction(action);
		for (ModifierBlock child : children) child.performAction(action);;
		if (modifiers != null) modifiers.performAction(action);
	}
	
	public String hierarchy(int tab) {
		String out = "";
		for (int i = 0; i < tab; i++) out += "  ";
		out += children.toString() + "\n";
		if (modifiers != null) out += modifiers.hierarchy(tab + 1);
		return out;
	}

	@Override
	public void addFields(HashCode hashCode) {
		hashCode.addField(children);
		hashCode.addField(modifiers);
	}

	@Override
	protected void copyFields(Sprite castMe) {
		ModifierGroup copy = (ModifierGroup) castMe;
		for (ModifierBlock child : children) {
			copy.addChild((ModifierBlock) child.copy());
		}
		if (modifiers != null) copy.setModifiers((ModifierGroup) modifiers.copy());
	}
}