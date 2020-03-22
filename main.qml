import controls.Button;
import controls.Edit;
import "StartPage.qml";
import "CodePage.qml";
import "PhotosPage.qml";

Application {
	id: photoapp;
	PageStack {
		id: pageStack;
		property string url;
		property int code;
		StartPage {
			id: startpage;
			onCodeEvent: {
				log("onCodeEvent");
				pageStack.currentIndex = 1;
			}
		}

		CodePage {
			id: codepage;
			onBackPressed: {
				pageStack.currentIndex = 0;
			}
			onPhotosEvent: {
				log("onPhotosEvent");
				pageStack.url = "apps/StingrayPhotos/img/photo.png"; //запрос на первую пикчу, обработка на загрузили ли вообще
				pageStack.currentIndex = 2;
			}
		}

		PhotosPage {
			id: photospage;
			onBackPressed: {
				log("returned");
				pageStack.currentIndex = 0;
			}
			onSelectPressed: {
				log("NextPhotoGoes");
				pageStack.url = "apps/StingrayPhotos/img/HomeBackground.png"; //запрос на некст пикчу, нужна обработка на конец
				pageStack.currentIndex = 2;
			}
		}
	}
}

