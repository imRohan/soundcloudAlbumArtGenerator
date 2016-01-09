import 'dart:html';
import 'dart:core';
import 'dart:math' show Random;

ButtonElement generateButton;
Element inputText;
Element albumArt;
Element inputView;
Element albumStyle;
Element setAlbumTitleStyle;
Element setAlbumArtistStyle;

void main() {
	generateButton = querySelector('#generate-album-btn');
  generateButton.onClick.listen(updateAlbum);
  querySelector('#album-style').onInput.listen(changeStyle);
  querySelector('#artist-change').onInput.listen(changeName);
  querySelector('#album-change').onInput.listen(changeTitle);
  querySelector('#random-album').onClick.listen(test);
}

void updateAlbum(Event e) {
	inputView = querySelector('.input-view');
	albumArt = querySelector('.render-view');
	generateAlbumInfo();
	inputView.classes.toggle('hidden');
	albumArt.classes.toggle('visible');
}

void generateAlbumInfo() {
	var randomIndex = new Random();
	List artistNames =  ['Bounce', 'Fade', 'Near', 'Us', 'Believe', 'Live', 'Sway'];
	List albumNames =  ['Bounce', 'Fade', 'Near', 'Us', 'Believe', 'Live', 'Sway'];
	String _artistName;
	String _albumName;
	_artistName = artistNames[randomIndex.nextInt(artistNames.length)];
	_albumName = albumNames[randomIndex.nextInt(albumNames.length)];
	querySelector('.artist-name').text = _artistName;
	querySelector('.album-name').text = _albumName;	
}

void changeStyle(Event e){
	String albumStyle = 'style-' + querySelector('#album-style').value;
	setAlbumTitleStyle = querySelector('.album-name');
	setAlbumArtistStyle = querySelector('.artist-name');
	String currentStyle = setAlbumTitleStyle.dataset['style'];
	swapStyles(setAlbumTitleStyle, currentStyle, albumStyle);
	swapStyles(setAlbumArtistStyle, currentStyle, albumStyle);
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

void test(Event e){
	generateAlbumInfo();
}