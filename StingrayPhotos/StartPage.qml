import controls.Button;
import controls.FocusablePanel;

Item {
	id: mainMenu;
	focus: true;
	
	Image {
		id: background;
		anchors.horizontalCenter: safeArea.horizontalCenter;
		anchors.verticalCenter: safeArea.verticalCenter;
		source: "apps/StingrayPhotos/img/HomeBackground.png";//другое фото
	}

	signal CodeEvent();

	FocusablePanel {
		id: menuButton;
		anchors.horizontalCenter: safeArea.horizontalCenter;
		anchors.verticalCenter: safeArea.verticalCenter;
		width: 180;
		height: 180;
		color: active ? "#ddddff" : colorTheme.focusablePanelColor;
		radius: 90;
		Image {
			id: txt;
			source: "apps/StingrayPhotos/img/play.png";
			width: 180;
			height: 180;
			anchors.horizontalCenter: safeArea.horizontalCenter;
			anchors.verticalCenter: safeArea.verticalCenter;
		}
		//another button to get code
		onSelectPressed: {
			log("StartButton PRESSED!");
			parent.CodeEvent();
		}
	}
}

