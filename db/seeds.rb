require_relative '../config/environment'

def create_all_prestiges
    prestige_data = [
        {
            name: "Jedi Guardian",
            leader: "Skarch Vaunk",
            description: "Lorem ipsum",
            image_url: "/images/Guardian_Protector.png"
        },
        {
            name: "Jedi Sentinel",
            leader: "Restelly Quist",
            description: "Lorem ipsum",
            image_url: "/images/Jedi_Sentinel_Shadow.png"
        },
        {   name: "Jedi Consular",
            leader: "Sabla-Mandibu",
            description: "Lorem ipsum",
            image_url: "/images/Consular_Sage.png"
        }
    ]
    prestige_data.each do |prestige|
        Prestige.create(prestige)
    end
end

create_all_prestiges