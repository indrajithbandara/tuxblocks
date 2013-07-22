package tuxkids.tuxblocks.core.solve.blocks.n.sprite;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import playn.core.GroupLayer;
import playn.core.Image;
import playn.core.ImageLayer;
import playn.core.Layer;
import playn.core.Pointer.Event;
import playn.core.Pointer.Listener;
import playn.core.util.Clock;
import pythagoras.f.Rectangle;
import tripleplay.util.Colors;
import tuxkids.tuxblocks.core.solve.blocks.n.markup.Renderer;
import tuxkids.tuxblocks.core.solve.blocks.n.sprite.BaseBlockSprite.BlockListener;
import tuxkids.tuxblocks.core.utils.CanvasUtils;
import tuxkids.tuxblocks.core.utils.HashCode;
import tuxkids.tuxblocks.core.utils.HashCode.Hashable;

public abstract class ModifierGroup extends Sprite implements Hashable {

	protected final static int MODIFIERS_DEPTH = 0;
	protected static final int CHILD_START_DEPTH = -1;
	protected static final int SIMPLIFY_DEPTH = 1;
	
	protected abstract void updateChildren(float base, float dt);
	protected abstract void updateRect();
	protected abstract ModifierGroup createModifiers();
	protected abstract boolean canAdd(ModifierBlockSprite sprite);
	protected abstract void updateSimplify();
	protected abstract void simplify(ModifierBlockSprite sprite);
	protected abstract Renderer createRenderer(Renderer base);
	public abstract void addNegative();
	
	protected GroupLayer layer;
	protected Rectangle rect = new Rectangle();
	protected Rectangle parentRect = new Rectangle();
	protected boolean multiExpression;
	protected BlockListener blockListener;

	private List<ModifierBlockSprite> toRemove = new ArrayList<ModifierBlockSprite>();
	
	protected List<ModifierBlockSprite> children = new ArrayList<ModifierBlockSprite>(),
			destroying = new ArrayList<ModifierBlockSprite>();
	protected ModifierGroup modifiers;
	
	private static Image simplifyImage;
	private List<ImageLayer> simplifyButtons = new ArrayList<ImageLayer>();
	private HashMap<ImageLayer, ModifierBlockSprite> simplifyMap = new HashMap<ImageLayer, ModifierBlockSprite>();
	private Listener simplifyListener = new Listener() {
		@Override
		public void onPointerStart(Event event) { onSimplify(event.hit()); }
		@Override
		public void onPointerEnd(Event event) { }
		@Override
		public void onPointerDrag(Event event) { }
		@Override
		public void onPointerCancel(Event event) { }
	}; 
	
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
	
	public ModifierGroup(Sprite parent) {
		layer = graphics().createGroupLayer();
		updateParentRect(parent);
	}
	
	protected ImageLayer getSimplifyButton(ModifierBlockSprite sprite) {
		while (simplifyButtons.size() <= simplifyMap.size()) { 
			addSimplifyButton();
		}
		ImageLayer layer = simplifyButtons.get(simplifyMap.size());
		simplifyMap.put(layer, sprite);
		layer.setVisible(true);
		return layer;
	}
	
	private void addSimplifyButton() {
		if (simplifyImage == null) {
			simplifyImage = CanvasUtils.createCircle(modSize() / 3, Colors.GRAY, 1, Colors.BLACK);
		}
		ImageLayer simplifyButton = graphics().createImageLayer(simplifyImage);
		simplifyButton.setAlpha(0.5f);
		simplifyButton.setDepth(SIMPLIFY_DEPTH);
		simplifyButton.setVisible(false);
		simplifyButton.addListener(simplifyListener );
		centerImageLayer(simplifyButton);
		simplifyButtons.add(simplifyButton);
		layer.add(simplifyButton);
	}
	
	private void onSimplify(Layer hit) {
		ModifierBlockSprite sprite;
		if ((sprite = simplifyMap.get(hit)) != null) {
			simplify(sprite);
		}
	}
	
	private void updateSimplifyAbstract() {
		for (ImageLayer button : simplifyButtons) {
			button.setVisible(false);
		}
		simplifyMap.clear();
		updateSimplify();
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
	
	protected void addVerticalModifiers(List<VerticalModifierSprite> mods) {
		if (modifiers == null) return;
		for (ModifierBlockSprite mod : modifiers.children) {
			if (mod instanceof VerticalModifierSprite) {
				mods.add((VerticalModifierSprite) mod);
			} else {
				break;
			}
		}
		modifiers.addVerticalModifiers(mods);
		
	}
	
	protected void addNewModifiers() {
		if (modifiers != null) return;
		setModifiers(createModifiers());
	}
	
	protected ModifierGroup removeModifiers() {
		ModifierGroup mods = modifiers;
		if (modifiers != null) layer.remove(modifiers.layer());
		modifiers = null;
		return mods;
	}
	
	protected void setModifiers(ModifierGroup mods) {
		removeModifiers();
		modifiers = mods;
		if (modifiers != null) {
			layer.add(modifiers.layer());
			modifiers.layer().setDepth(MODIFIERS_DEPTH);
		}
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
	
	public void addBlockListenerListener(BlockListener listener) {
		this.blockListener = listener;
		for (ModifierBlockSprite child : children) {
			child.addBlockListener(listener);
		}
		if (modifiers != null) {
			modifiers.addBlockListenerListener(listener);
		}
	}

	protected ModifierBlockSprite removeChild(ModifierBlockSprite sprite) {
		for (int i = 0; i < children.size(); i++) {
			if (children.get(i) == sprite) {
				return children.remove(i); // make sure it's the exact sprite and not just .equal()
			}
		}
		return null;
	}
	
	protected ModifierBlockSprite removeChild(ModifierBlockSprite sprite, boolean destroy) {
		ModifierBlockSprite child = removeChild(sprite);
		if (destroy) {
			destroying.add(child);
		}
		return child;
	}

	protected void addChild(ModifierBlockSprite child) {
		float depth = CHILD_START_DEPTH;
		if (children.size() > 0) depth = children.get(children.size() - 1).layer().depth() - 1;
		children.add(child);
		layer.add(child.layer());
		child.layer().setVisible(true);
		child.layer().setDepth(depth);
		child.group = this;
		child.addBlockListener(blockListener);
		
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
			for (ModifierBlockSprite child : modifiers.modifiers.children) {
				toRemove.add(child);
			}
			for (ModifierBlockSprite child : toRemove) {
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
	
	public ModifierBlockSprite addModifier(ModifierBlockSprite sprite, boolean snap) {
		if (modifiers == null && canAdd(sprite)) {
			addChild(sprite);
			if (snap) {
				updateRect();
				updateChildren(0, 1);
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

	public ModifierBlockSprite addExpression(NumberBlockSprite sprite, boolean snap) {
		if (modifiers != null) {
			return modifiers.addExpression(sprite, snap);
		}
		return null;
	}
	
	public boolean canAddExpression(NumberBlockSprite sprite) {
		if (modifiers != null) {
			return modifiers.canAddExpression(sprite);
		}
		return false;
	}
	
	@Override
	public void update(int delta) {
		for (int i = 0; i < children.size(); i++) {
			ModifierBlockSprite sprite = children.get(i);
			if (sprite.group() != this) {
				removeChild(sprite); 
				i--;
			} else {
				sprite.update(delta, multiExpression);
			}
		}
		
		
		for (int i = 0; i < destroying.size(); i++) {
			ModifierBlockSprite sprite = destroying.get(i);
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
		updateSimplifyAbstract();
	}
	
	public void update(int delta, boolean multiExpression) {
		this.multiExpression = multiExpression;
		update(delta);
	}

	@Override
	public void paint(Clock clock) {
		updateRect();
		updateChildren(lerpBase(), clock.dt());
		for (ModifierBlockSprite sprite : children) {
			sprite.paint(clock);
		}
		for (ModifierBlockSprite sprite : destroying) {
			sprite.layer().setAlpha(lerpTime(sprite.layer().alpha(), 0, 0.995f, clock.dt(), 0.01f));
			sprite.paint(clock);
		}
		if (modifiers != null) {
			modifiers.updateParentRect(this);
			modifiers.paint(clock);
		}
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
}
