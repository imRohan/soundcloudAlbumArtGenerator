import 'dart:html';
import 'dart:math' show Random;

ButtonElement genButton;

void main() {
  querySelector('#artist-input').onInput.listen(updateAlbum);
}

void updateAlbum(Event e) {
  String inputName = (e.target as InputElement).value;
  setArtistName(inputName);
  generateAlbumName();
}

void setArtistName(String newName) {
  querySelector('.artist-name').text = newName;
}

generateAlbumName() {
	var randomIndex = new Random();
	List albumNames =  ['one', 'two'];
	String _albumName;
	_albumName = albumNames[randomIndex.nextInt(albumNames.length)];
	querySelector('.album-name').text = _albumName;	
}
