import 'dart:html';
import 'dart:core';
import 'dart:math' show Random;

ButtonElement generateButton;
Element inputText;
Element albumArt;
Element inputView;

void main() {
	generateButton = querySelector("#generate-album-btn");
  generateButton.onClick.listen(updateAlbum);
}

void updateAlbum(Event e) {
	inputText = querySelector("#artist-input");
	inputView = querySelector(".input-view");
	albumArt = querySelector(".render-view");
  String inputName = inputText.value;
  setArtistName(inputName);
  generateAlbumName();
  inputView.classes.toggle('hidden');
  albumArt.classes.toggle('visible');
}

void setArtistName(String newName) {
  querySelector('.artist-name').text = newName;
}

void generateAlbumName() {
	var randomIndex = new Random();
	List albumNames =  ['one', 'two'];
	String _albumName;
	_albumName = albumNames[randomIndex.nextInt(albumNames.length)];
	querySelector('.album-name').text = _albumName;	
}
