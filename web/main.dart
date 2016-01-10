import 'dart:html';
import 'dart:core';
import 'dart:math' show Random;

ButtonElement generateButton;
Element album;
Element albumArt;
Element inputView;
Element setAlbumTitleStyle;
Element setAlbumArtistStyle;

CanvasElement canvas = document.querySelector('#application-wrapper');

void main() {
	generateButton = querySelector('#generate-album-btn');
  generateButton.onClick.listen(updateAlbum);

  album = querySelector('.album');
  albumArt = querySelector('.render-view');
  inputView = querySelector('.input-view');

  setAlbumTitleStyle = querySelector('.album-name');
	setAlbumArtistStyle = querySelector('.artist-name');

  querySelector('#album-style').onInput.listen(changeStyle);
  querySelector('#artist-change').onInput.listen(changeName);
  querySelector('#album-change').onInput.listen(changeTitle);
  querySelector('#random-album').onClick.listen(randomizeText);
  querySelector('#save-album').onClick.listen(saveAlbum);


  mouseMove();
}

void updateAlbum(Event e) {
	generateAlbumInfo();
	inputView.classes.toggle('hidden');
	albumArt.classes.toggle('visible');
}

void generateAlbumInfo() {
	var randomIndex = new Random();
	List artistNames =  ['ToFlo', 'Pharma-C', 'Jo-E', 'Fader', 'Zhu', 'Flume', 'Dj Sabo', 'Steve Void', 'Fonky-Town', 'Nu-Mark', 'Flamingosis', 'Da Future', 'Rufus', 'Coyote Kisses', 'Joe Burns'];
	List albumNames =  ['Bounce', 'Fade', 'Near', 'Us', 'Believe', 'Live', 'Sway'];
	String _artistName;
	String _albumName;
	_artistName = artistNames[randomIndex.nextInt(artistNames.length)];
	_albumName = albumNames[randomIndex.nextInt(albumNames.length)];
	querySelector('.artist-name').text = _artistName;
	querySelector('.album-name').text = _albumName;	
}

void changeStyle(Event e){
	String _albumStyle = 'style-' + querySelector('#album-style').value;
	String _currentStyle = setAlbumTitleStyle.dataset['style'];
	swapStyles(setAlbumTitleStyle, _currentStyle, _albumStyle);
	swapStyles(setAlbumArtistStyle, _currentStyle, _albumStyle);
}

void swapStyles(element, currentStyle, newStyle){
	element.classes.remove(currentStyle);
	element.classes.add(newStyle);
	element.dataset['style'] = newStyle;
}

void changeName(Event e){
	querySelector('.artist-name').text = e.target.value;
}

void changeTitle(Event e){
	querySelector('.album-name').text = e.target.value;
}

void randomizeText(Event e){
	generateAlbumInfo();
}

void mouseMove(){
	// canvas.onMouseMove.listen((e) {
	//   Int newY = e.client.y %10;
	//   print(newY);
	//   album.style.transform = "perspective(200px) rotateY(-$newY deg)";
	// });
}
