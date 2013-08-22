package tuxkids.tuxblocks.core.widget;

import playn.core.CanvasImage;
import playn.core.Color;
import playn.core.ImageLayer;
import playn.core.Platform.Type;
import playn.core.PlayN;
import playn.core.Pointer.Event;
import playn.core.TextFormat;
import playn.core.TextLayout;
import playn.core.util.Clock;
import tripleplay.game.ScreenStack;
import tripleplay.util.Colors;
import tuxkids.tuxblocks.core.Audio;
import tuxkids.tuxblocks.core.Constant;
import tuxkids.tuxblocks.core.screen.BaseScreen;
import tuxkids.tuxblocks.core.screen.GameScreen;
import tuxkids.tuxblocks.core.title.AboutScreen;
import tuxkids.tuxblocks.core.utils.CanvasUtils;
import tuxkids.tuxblocks.core.widget.Button.OnReleasedListener;
import tuxkids.tuxblocks.core.widget.SlideLayer.FillListener;

public class MainMenuLayer extends MenuLayer {
	
	private static MainMenuLayer instance; 
	
	public static void show(BaseScreen screen) {
		if (instance == null || instance.destroyed()) {
			instance = new MainMenuLayer();
		}
		instance.screen = screen;
		show(instance);
	}
	
	public static void toggle(BaseScreen screen) {
		if (!showing()) {
			show(screen);
		} else {
			hide();
		}
	}

	protected final SlideLayer slideBG, slideSE;
	protected final Button buttonExit;
	protected final float buttonTextSize;
	
	protected BaseScreen screen;
	protected float startBGVolume;
	
	public MainMenuLayer() {
		super(gWidth() * 0.7f, gHeight() * 0.7f);
		
		slideBG = createSlider("Music Volume", 0);
		slideBG.setFillListener(new FillListener() {
			@Override
			public void onFillChanged(float fill) {
				Audio.bg().setVolume(fill);
			}
		});
		
		slideSE = createSlider("Effects Volume", 0.3f * height);
		slideSE.setFillListener(new FillListener() {
			@Override
			public void onFillChanged(float fill) {
				Audio.se().setVolume(fill);
			}
		});
	
		
		buttonTextSize = slideSE.height * 0.6f;
		
		buttonExit = new Button(null, false);
		buttonExit.setPosition(0, -0.3f * height);
		layer.add(buttonExit.layerAddable());
	}
	
	protected SlideLayer createSlider(String caption, float y) {
		SlideLayer slider = new SlideLayer(width * 0.8f, height * 0.2f, Colors.GRAY);
		slider.setOrigin(slider.width / 2, slider.height / 2);
		slider.setTranslation(0, y);
		layer.add(slider.layerAddable());

		TextFormat captionFormat = createFormat(slider.height * 0.25f);
		ImageLayer textLayer = graphics().createImageLayer(
				CanvasUtils.createText(caption, captionFormat, Colors.BLACK));
		centerImageLayer(textLayer);
		layer.add(textLayer);
		textLayer.setTranslation(0, y);

		return slider;
	}
	
	@Override
	protected void showInstance() {
		super.showInstance();
		
		slideBG.setFill(Audio.bg().volume());
		slideSE.setFill(Audio.se().volume());
		startBGVolume = Audio.bg().volume();
		
		updateButtons();
	}
	
	protected void updateButtons() {		
		if (screen instanceof GameScreen) {
			createGameButton();
			buttonExit.setEnabled(((GameScreen) screen).canSave());
			buttonExit.layerAddable().setAlpha(buttonExit.enabled() ? 1f : 0.5f);
		} else {
			createMenuButton();
			buttonExit.setEnabled(!(screen instanceof AboutScreen));
			buttonExit.layerAddable().setAlpha(buttonExit.enabled() ? 1f : 0.5f);
		}
	}
	
	protected void createMenuButton() {
		createButton(buttonExit, width * 0.8f, "About TuxBlocks", buttonTextSize, new OnReleasedListener() {
			@Override
			public void onRelease(Event event, boolean inButton) {
				if (inButton) {
					hideInstance();
					ScreenStack screens = screen.screens();
					screen.pushScreen(new AboutScreen(screens, screen.background()), 
							screens.slide().up());
				}
			}
		});
	}
	
	protected void createGameButton() {
		createButton(buttonExit, width * 0.8f, "Save and Quit", buttonTextSize, new OnReleasedListener() {
			@Override
			public void onRelease(Event event, boolean inButton) {
				if (inButton) {
					if (screen instanceof GameScreen) {
						((GameScreen) screen).quit();
						showing = false;
					}
				}
			}
		});
	}

	@Override
	protected void hideInstance() {
		super.hideInstance();
		PlayN.storage().setItem(Constant.KEY_BG_VOLUME, "" + Audio.bg().volume());
		PlayN.storage().setItem(Constant.KEY_SE_VOLUME, "" + Audio.se().volume());
		if (PlayN.platformType() == Type.HTML) {
			if (startBGVolume != Audio.bg().volume()) {
				Audio.bg().restart();
			}
		}
	}
	
	@Override
	protected void paintInstance(Clock clock) {
		super.paintInstance(clock);
		if (showing) {
			slideBG.paint(clock);
			slideSE.paint(clock);
		}
	}
}
