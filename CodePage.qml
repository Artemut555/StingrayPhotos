import controls.Edit;

Rectangle {
    height: 650;
    width: 1250;
    focus: true;
    anchors.fill: mainWindow;
    color: "#FFFFFF";
    
    signal PhotosEvent();

    SubheadText {
	y: 70;
        color: "#000000";
        anchors.horizontalCenter: parent.horizontalCenter;
        text: "Введите код на сайте 167.172.51.41/photos";
    }

    TitleText {
	y: 180;
        color: "#000000";
        anchors.horizontalCenter: parent.horizontalCenter;
        text: pageStack.code;
    }

    FocusablePanel {
        id: menuButton;
	anchors.horizontalCenter: safeArea.horizontalCenter;
	y: 300;
	width: 180;
	height: 180;
	color: active ? "#ddddff" : colorTheme.focusablePanelColor;
	radius: 90;

	Image {
	    id: txt;
	    source: "apps/StingrayPhotos/img/play.png";
	    width: 180;
	    height: 180;
	    anchors.horizontalCenter: parent.horizontalCenter;
	    anchors.verticalCenter: parent.verticalCenter;
	}

        onSelectPressed: {
            log("CodeButton PRESSED!");
            parent.PhotosEvent();
        }
    }
}
