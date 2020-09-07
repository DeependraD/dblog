#!/usr/bin/python3

# # or
# reticulate::use_python("/usr/bin/python3", TRUE)
# reticulate::repl_python()

# load the libraries
from mutagen.mp3 import MP3
from mutagen.easyid3 import EasyID3
import mutagen.id3
from mutagen.id3 import ID3, TIT2, TIT3, TALB, TPE1, TRCK, TYER, APIC

import glob

import numpy as np

# extract the file names (including full path)
mp3_files = glob.glob("/media/deependra/e4da4ac5-3b38-4b89-9402-397eb940e4d3/Music & Audibles/Nepathaya/*.mp3")
# mp3_files = glob.glob("/media/deependra/e4da4ac5-3b38-4b89-9402-397eb940e4d3/Music & Audibles/Ryu/Ryu - Tanks for the Memories/*.mp3")

# for the mp3s in the album
mp3_files[0].split("/")

# # EasyID3
# # EasyID3 does not recognize the album art tags
# for shitfile in np.arange(len(mp3_files)):
#     print(list(EasyID3(mp3_files[shitfile])))

## ID3
# this does the job for album art
for shitfile in np.arange(len(mp3_files)):
    ## obtain entire mp3 file and use .tag() method on self
    # audio_mp3 = MP3()
    ## obtain id3 tag only
    audio_id = ID3(mp3_files[shitfile])
    ## find the keys
    # list(audio_id.keys())
    ## now check if the file has APIC tag
    if 'APIC:' in list(audio_id.keys()):
        have_apic = mp3_files[shitfile]
        print(have_apic)

# # to add an album art
# # use APIC() for generating the tag
# APIC(encoding=3, mime='image/jpeg', type=3, desc=u'Cover', data=albumart.read())
# # use save method on self.
# audio_id.save()
