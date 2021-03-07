require_relative '../config/environment'

def create_all_prestiges
    prestige_data = [
        {
            name: "Jedi Battlemaster",
            leader: "Daric Doldarra",
            description: "Is it battle that stirs you, to meet an enemy blade upon blade? Such is the way of the greatest of Jedi warriors, the battlemasters.",
            image_url: "/images/Guardian_Protector.png"
        },
        {
            name: "Jedi Shadow",
            leader: "Karista Pho",
            description: "Or perhaps it is investigating the mysteries of the galaxy, seeking out injustice and harm, and bringing it into the light? Such is the way of the Jedi Shadows in the time of Ulic Qel-Droma… and Exar Kun.",
            image_url: "/images/Jedi_Sentinel_Shadow.png"
        },
        {   name: "Jedi Sage",
            leader: "Erestria Telanar",
            description: "Or perhaps your way lies upon the ancient mysteries… and to teach others the ways of the Force, as I have, the way of the Jedi Sages.",
            image_url: "/images/Consular_Sage.png"
        }
    ]
    prestige_data.each do |prestige|
        Prestige.create(prestige)
    end
end

create_all_prestiges