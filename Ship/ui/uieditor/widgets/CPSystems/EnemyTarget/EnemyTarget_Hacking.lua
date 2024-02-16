-- ee8a8acaa1817cf9672e156f184601ee
-- This hash is used for caching, delete to decompile the file again

CoD.EnemyTarget_Hacking = InheritFrom( LUI.UIElement )
CoD.EnemyTarget_Hacking.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.EnemyTarget_Hacking )
	self.id = "EnemyTarget_Hacking"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 144 )
	self:setTopBottom( true, false, 0, 144 )
	
	local hackingBackground = LUI.UIImage.new()
	hackingBackground:setLeftRight( false, false, -72, 72 )
	hackingBackground:setTopBottom( false, false, -72, 72 )
	hackingBackground:setRGB( 0.35, 0.35, 0.35 )
	hackingBackground:setAlpha( 0.8 )
	hackingBackground:setImage( RegisterImage( "uie_t7_hud_cp_bleeding_out_progresscircle" ) )
	self:addElement( hackingBackground )
	self.hackingBackground = hackingBackground
	
	local hackingRing = LUI.UIImage.new()
	hackingRing:setLeftRight( false, false, -72, 72 )
	hackingRing:setTopBottom( false, false, -72, 72 )
	hackingRing:setRGB( 0.68, 0.89, 0.98 )
	hackingRing:setAlpha( 0.8 )
	hackingRing:setImage( RegisterImage( "uie_t7_hud_cp_bleeding_out_progresscircle" ) )
	hackingRing:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	hackingRing:setShaderVector( 1, 0.5, 0, 0, 0 )
	hackingRing:setShaderVector( 2, 0.5, 0, 0, 0 )
	hackingRing:setShaderVector( 3, 0, 0, 0, 0 )
	hackingRing:subscribeToGlobalModel( controller, "PerController", "WorldSpaceIndicators.hackingPercent", function ( model )
		local WorldSpaceIndicatorsHackingPercent = Engine.GetModelValue( model )
		if WorldSpaceIndicatorsHackingPercent then
			hackingRing:setShaderVector( 0, CoD.GetVectorComponentFromString( WorldSpaceIndicatorsHackingPercent, 1 ), CoD.GetVectorComponentFromString( WorldSpaceIndicatorsHackingPercent, 2 ), CoD.GetVectorComponentFromString( WorldSpaceIndicatorsHackingPercent, 3 ), CoD.GetVectorComponentFromString( WorldSpaceIndicatorsHackingPercent, 4 ) )
		end
	end )
	self:addElement( hackingRing )
	self.hackingRing = hackingRing
	
	local hackingIcon = LUI.UIImage.new()
	hackingIcon:setLeftRight( false, false, -42, 42 )
	hackingIcon:setTopBottom( false, false, -42, 42 )
	hackingIcon:setImage( RegisterImage( "uie_t7_cp_hud_ability_icon_hijack" ) )
	self:addElement( hackingIcon )
	self.hackingIcon = hackingIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.hackingRing:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
