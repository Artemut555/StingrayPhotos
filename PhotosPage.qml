import controls.Button;
import controls.FocusablePanel;

Item {
	id: photo;
	focus: true;
	Image {
		id: background;
		anchors.horizontalCenter: safeArea.horizontalCenter;
		anchors.verticalCenter: safeArea.verticalCenter;
		source: pageStack.url;
	}
}
