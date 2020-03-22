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
			pageStack.code = 2;
			var request = new XMLHttpRequest();
			request.open("GET", "http://127.0.0.1:8000/get_key/", true);
			request.onreadystatechange = function() {
				 if (request.readyState !== XMLHttpRequest.DONE)
					return;
				 if (request.status === 200) {
					log("response was received");
					pageStack.code = JSON.parse(request.responseText)["key"];
				 } else
					log("unhandled status", request.status);
			}
			request.send();
			log("StartButton PRESSED!");
			parent.CodeEvent();
		}
	}
}

