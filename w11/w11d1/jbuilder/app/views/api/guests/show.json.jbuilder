# json.extract! @guest, :name, :age, :favorite_color

    json.partial! "api/guests/guest", guest: @guest
    json.gifts do
        json.array! @guest.gifts, :title, :description
    end

    # json.array! @guest.gifts 
    # this will break because we can't merge an 
    # an object to an array
