import controls.Edit;

Rectangle {
    height: 650;
    width: 1250;
    anchors.fill: mainWindow;
    color: "#FFFFFF";
    
    signal PhotosEvent();
    
    Text {
	y: 70;
        color: "#000000";
        font: Font {
            family: "Proxima Nova";
            bold: true;
            pixelSize: 30;
	}
        anchors.horizontalCenter: parent.horizontalCenter;
        text: "Зайдите на сайт";
    }

    Text {
	y: 100;
        color: "#000000";
        font: Font {
            family: "Courier New";
            bold: false;
            pixelSize: 60;
	}
        anchors.horizontalCenter: parent.horizontalCenter;
        text: "https://tinyurl.com/stingrayPhotos";
    }

    Text {
	y: 220;
        color: "#000000";
        font: Font {
            family: "Proxima Nova";
            bold: true;
            pixelSize: 40;
	}
        anchors.horizontalCenter: parent.horizontalCenter;
        text: "Введите код";
    }

    Text {
	y: 240;
        color: "#000000";
        font: Font {
            family: "Proxima Nova";
            bold: false;
            pixelSize: 300;
	}
        anchors.horizontalCenter: parent.horizontalCenter;
        text: pageStack.code;
    }

    FocusablePanel {
        id: menuButton;
	y: 500;
	width: 220;
	height: 45;
	color: active ? colorTheme.focusablePanelColo : "#000000";
        anchors.horizontalCenter: parent.horizontalCenter;

	Text {
	    anchors.verticalCenter: parent.verticalCenter;
            anchors.horizontalCenter: parent.horizontalCenter;
            color: "#FFFFFF";
            text: "Начать показ";
            font: Font {
                family: "Proxima Nova";
                bold: false;
                pixelSize: 40;
            }
	}

        onSelectPressed: {
            log("CodeButton PRESSED!");
            parent.PhotosEvent();
        }
    }
}
