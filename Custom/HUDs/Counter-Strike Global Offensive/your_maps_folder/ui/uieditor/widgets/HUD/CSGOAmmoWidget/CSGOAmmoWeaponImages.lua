-- This file allows you to set up your UI icons for custom weapons

-- Format: Name of the weaponfile, image it should display on the hud
-- You can add as many as you need to the table

-- Make sure you DO NOT include the suffix (_ZM at the end) like I have for the examples below
-- The examples can be left in if desired, as the hud already includes the image files for them

-- When you're done, add the image assets to your map's zone file in the following format:
-- image,name

-- Recommended resolution for your weapon images: Width: 332px Height: 144px (Based on the stock BO3 pickup images that I scaled the UIImage element to)
-- NOTE: The last element in the table should NOT have a comma ","

CoD.CSGOAmmoWeaponImages = {
    ray_gun = "csgo_raygun",
    ray_gun_upgraded = "csgo_raygun"
}
