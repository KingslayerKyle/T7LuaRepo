CoD.prestigeRewardWidget_UI3D = InheritFrom( LUI.UIElement )
CoD.prestigeRewardWidget_UI3D.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.prestigeRewardWidget_UI3D )
	self.id = "prestigeRewardWidget_UI3D"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 125 )
	self:setTopBottom( true, false, 0, 25 )
	
	local digit1 = LUI.UITightText.new()
	digit1:setLeftRight( false, false, -62.4, -41.6 )
	digit1:setTopBottom( false, false, -12.5, 12.5 )
	digit1:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	digit1:subscribeToGlobalModel( controller, "CurrentWeapon", "weaponPrestigeUI3DText", function ( model )
		local weaponPrestigeUI3DText = Engine.GetModelValue( model )
		if weaponPrestigeUI3DText then
			digit1:setText( SetValueIfEmptyString( "-", GetRightAlignedCharacter( 1, 6, weaponPrestigeUI3DText ) ) )
		end
	end )
	self:addElement( digit1 )
	self.digit1 = digit1
	
	local digit2 = LUI.UITightText.new()
	digit2:setLeftRight( false, false, -41.6, -20.8 )
	digit2:setTopBottom( false, false, -12.5, 12.5 )
	digit2:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	digit2:subscribeToGlobalModel( controller, "CurrentWeapon", "weaponPrestigeUI3DText", function ( model )
		local weaponPrestigeUI3DText = Engine.GetModelValue( model )
		if weaponPrestigeUI3DText then
			digit2:setText( SetValueIfEmptyString( "-", GetRightAlignedCharacter( 2, 6, weaponPrestigeUI3DText ) ) )
		end
	end )
	self:addElement( digit2 )
	self.digit2 = digit2
	
	local digit3 = LUI.UITightText.new()
	digit3:setLeftRight( false, false, -20.8, 0 )
	digit3:setTopBottom( false, false, -12.5, 12.5 )
	digit3:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	digit3:subscribeToGlobalModel( controller, "CurrentWeapon", "weaponPrestigeUI3DText", function ( model )
		local weaponPrestigeUI3DText = Engine.GetModelValue( model )
		if weaponPrestigeUI3DText then
			digit3:setText( SetValueIfEmptyString( "-", GetRightAlignedCharacter( 3, 6, weaponPrestigeUI3DText ) ) )
		end
	end )
	self:addElement( digit3 )
	self.digit3 = digit3
	
	local digit4 = LUI.UITightText.new()
	digit4:setLeftRight( false, false, 0, 20.8 )
	digit4:setTopBottom( false, false, -12.5, 12.5 )
	digit4:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	digit4:subscribeToGlobalModel( controller, "CurrentWeapon", "weaponPrestigeUI3DText", function ( model )
		local weaponPrestigeUI3DText = Engine.GetModelValue( model )
		if weaponPrestigeUI3DText then
			digit4:setText( SetValueIfEmptyString( "-", GetRightAlignedCharacter( 4, 6, weaponPrestigeUI3DText ) ) )
		end
	end )
	self:addElement( digit4 )
	self.digit4 = digit4
	
	local digit5 = LUI.UITightText.new()
	digit5:setLeftRight( false, false, 20.8, 41.6 )
	digit5:setTopBottom( false, false, -12.5, 12.5 )
	digit5:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	digit5:subscribeToGlobalModel( controller, "CurrentWeapon", "weaponPrestigeUI3DText", function ( model )
		local weaponPrestigeUI3DText = Engine.GetModelValue( model )
		if weaponPrestigeUI3DText then
			digit5:setText( SetValueIfEmptyString( "-", GetRightAlignedCharacter( 5, 6, weaponPrestigeUI3DText ) ) )
		end
	end )
	self:addElement( digit5 )
	self.digit5 = digit5
	
	local digit6 = LUI.UITightText.new()
	digit6:setLeftRight( false, false, 41.6, 62.4 )
	digit6:setTopBottom( false, false, -12.5, 12.5 )
	digit6:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	digit6:subscribeToGlobalModel( controller, "CurrentWeapon", "weaponPrestigeUI3DText", function ( model )
		local weaponPrestigeUI3DText = Engine.GetModelValue( model )
		if weaponPrestigeUI3DText then
			digit6:setText( SetValueIfEmptyString( "-", GetRightAlignedCharacter( 6, 6, weaponPrestigeUI3DText ) ) )
		end
	end )
	self:addElement( digit6 )
	self.digit6 = digit6
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.digit1:close()
		element.digit2:close()
		element.digit3:close()
		element.digit4:close()
		element.digit5:close()
		element.digit6:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

