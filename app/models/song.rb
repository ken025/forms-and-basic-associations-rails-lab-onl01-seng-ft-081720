class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def notes=(notes_array)
    notes_array.each do |note|
      if note != ""
        new_note = Note.create(content: note, song_id: self.id)
        self.notes << new_note
      end
    end
  end
end
