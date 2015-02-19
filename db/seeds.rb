# Remove all existing Songs
Song.destroy_all

# Remove all existing Artists
Artist.destroy_all

# Add some new Artists
hip = Artist.create(:name => "Tragically Hip")
buddy = Artist.create(:name => "Buddy Holly")
creedence = Artist.create(:name => "Creedence Clearwater Revival")

# Add some new Songs
hip.songs.create(:title => "So Hard Done By")
hip.songs.create(:title => "Music @ Work")
hip.songs.create(:title => "Nautical Disaster")

buddy.songs.create(:title => "That'll Be The Day")
buddy.songs.create(:title => "Maybe Baby")
buddy.songs.create(:title => "Peggy Sue")

creedence.songs.create(:title => "Susie Q.")
creedence.songs.create(:title => "Fortunate Son")
creedence.songs.create(:title => "Someday Never Comes")
