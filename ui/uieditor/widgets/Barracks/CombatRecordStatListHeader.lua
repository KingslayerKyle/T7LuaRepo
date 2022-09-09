-- a5e69cb3ea6b2b41e419f23a80facea4
-- This hash is used for caching, delete to decompile the file again

CoD.CombatRecordStatListHeader = InheritFrom( LUI.UIElement )
CoD.CombatRecordStatListHeader.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CombatRecordStatListHeader )
	self.id = "CombatRecordStatListHeader"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 292 )
	self:setTopBottom( true, false, 0, 25 )
	
	local WeaponLabel = LUI.UITightText.new()
	WeaponLabel:setLeftRight( true, false, 0, 48 )
	WeaponLabel:setTopBottom( true, true, 0, 0 )
	WeaponLabel:setText( Engine.Localize( "MENU_WEAPON_CAPS" ) )
	WeaponLabel:setTTF( "fonts/default.ttf" )
	self:addElement( WeaponLabel )
	self.WeaponLabel = WeaponLabel
	
	local StatComparisonLabel = LUI.UIText.new()
	StatComparisonLabel:setLeftRight( false, true, -70, 0 )
	StatComparisonLabel:setTopBottom( true, true, 0, 0 )
	StatComparisonLabel:setRGB( ColorSet.PartyFriendlyBlue.r, ColorSet.PartyFriendlyBlue.g, ColorSet.PartyFriendlyBlue.b )
	StatComparisonLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	StatComparisonLabel:setTTF( "fonts/default.ttf" )
	StatComparisonLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	StatComparisonLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatComparisonLabel )
	self.StatComparisonLabel = StatComparisonLabel
	
	local StatLabel = LUI.UIText.new()
	StatLabel:setLeftRight( false, true, -125, -55 )
	StatLabel:setTopBottom( true, true, 0, 0 )
	StatLabel:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	StatLabel:setTTF( "fonts/default.ttf" )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	StatLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatLabel )
	self.StatLabel = StatLabel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				StatComparisonLabel:completeAnimation()
				self.StatComparisonLabel:setAlpha( 0 )
				self.clipFinished( StatComparisonLabel, {} )

				StatLabel:completeAnimation()
				self.StatLabel:setLeftRight( false, true, -70, 0 )
				self.StatLabel:setTopBottom( true, true, 0, 0 )
				self.clipFinished( StatLabel, {} )
			end
		},
		Comparison = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				StatComparisonLabel:completeAnimation()
				self.StatComparisonLabel:setAlpha( 1 )
				self.clipFinished( StatComparisonLabel, {} )

				StatLabel:completeAnimation()
				self.StatLabel:setLeftRight( false, true, -116, -46 )
				self.StatLabel:setTopBottom( true, true, 0, 0 )
				self.clipFinished( StatLabel, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Comparison",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
