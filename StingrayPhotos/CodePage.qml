import controls.Edit;

Item{
	height:650;
	width:1250;
	focus: true;

	Image {
		id: background;
		anchors.horizontalCenter: safeArea.horizontalCenter;
		anchors.verticalCenter: safeArea.verticalCenter;
		source: "apps/StingrayPhotos/img/MenuBackground.png";//another picture
	}
	
	signal PhotosEvent();

	FocusablePanel {

		id: codeButton;
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
		//сгенеренный код и кнопка продолжить
		onSelectPressed: {
			log("CodeButton PRESSED!");
			parent.PhotosEvent();
		}
	}
}
