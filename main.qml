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
	property int cnt;
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
                if(pageStack.code !== 0){
                    pageStack.url = "http://84.201.129.186:8000/get_image/?key=" + pageStack.code + "&num=" + pageStack.cnt;
                }
                log("onPhotosEvent");
		log(pageStack.url);
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
		pageStack.cnt = pageStack.cnt + 1;
                //new link is necessery to refresh image in PhotosPage
                if(pageStack.code !== 0){
                    pageStack.url = "http://84.201.129.186:8000/get_image/?key=" + pageStack.code + "&num=" + pageStack.cnt;
                }
		log(pageStack.url);
                pageStack.currentIndex = 2;
            }
        }
    }
}

