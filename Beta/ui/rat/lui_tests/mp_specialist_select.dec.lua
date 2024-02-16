Rat.MenuTests.mp_specialist_select = function ( root, controller, trackingId )
	local menu = Rat.FindMenuInRoot( root, "ChooseCharacterLoadout" )
	if not menu then
		return nil, nil
	else
		local getLoadoutList = function ( carouselWidget )
			if not activeWidget.item then
				return nil
			elseif not activeWidget.item.infoPanel then
				return nil
			elseif not activeWidget.item.infoPanel.loadoutOptions then
				return nil
			else
				return activeWidget.item.infoPanel.loadoutOptions
			end
		end
		
		local characterCarousel = menu.characterCarousel
		local lastActiveWidget = nil
		local steps = {
			{
				delay = 0,
				fn = function ()
					if not characterCarousel then
						return "ChooseCharacterLoadout does not contain element "characterCarousel""
					elseif not characterCarousel:setActiveIndex( 1, 1, 0 ) then
						return "ChooseCharacterLoadout failed to set the characterCarousel to the first item"
					else
						
					end
				end
			},
			{
				delay = 100,
				waitForRepeatCondition = function ()
					local activeWidget = characterCarousel.activeWidget
					local f4_local0
					if activeWidget then
						if not IsHeroLocked( activeWidget, controller ) and activeWidget.heroIndex ~= Engine.GetEquippedHero( controller ) then
							f4_local0 = not IsFirstItem( activeWidget )
						else
							f4_local0 = false
						end
					else
						f4_local0 = true
					end
					return f4_local0
				end,
				fn = function ()
					local activeWidget = characterCarousel.activeWidget
					if not activeWidget or activeWidget == lastActiveWidget then
						return "ChooseCharacterLoadout carousel ran out of valid options"
					else
						lastActiveWidget = activeWidget
						Rat.SimulateButtonPress( menu, controller, "shoulderr" )
					end
				end
			},
			{
				delay = 100,
				fn = function ()
					local activeWidget = characterCarousel.activeWidget
					Rat.DisableGoBack = true
					Rat.SimulateButtonPress( menu, controller, "primary" )
					Rat.DisableGoBack = false
					if activeWidget.heroIndex ~= Engine.GetEquippedHero( controller ) then
						return "ChooseCharacterLoadout failed to correctly select a new hero"
					else
						
					end
				end
			}
		}
		return menu, steps
	end
end

