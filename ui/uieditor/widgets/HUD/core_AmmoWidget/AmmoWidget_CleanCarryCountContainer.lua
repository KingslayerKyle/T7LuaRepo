-- 14a14c3e988ca73e960ea6fc1f3c8a0d
-- This hash is used for caching, delete to decompile the file again

CoD.AmmoWidget_CleanCarryCountContainer = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_CleanCarryCountContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_CleanCarryCountContainer )
	self.id = "AmmoWidget_CleanCarryCountContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 30 )
	self:setTopBottom( true, false, 0, 34 )
	
	local CarriedTagCount = LUI.UITightText.new()
	CarriedTagCount:setLeftRight( false, false, -15, 15 )
	CarriedTagCount:setTopBottom( true, false, 0, 34 )
	CarriedTagCount:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	CarriedTagCount:setLetterSpacing( -4 )
	CarriedTagCount:subscribeToGlobalModel( controller, "HUDItems", "cleanCarryCount", function ( model )
		local cleanCarryCount = Engine.GetModelValue( model )
		if cleanCarryCount then
			CarriedTagCount:setText( Engine.Localize( cleanCarryCount ) )
		end
	end )
	self:addElement( CarriedTagCount )
	self.CarriedTagCount = CarriedTagCount
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Hide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				CarriedTagCount:completeAnimation()
				self.CarriedTagCount:setAlpha( 0 )
				self.clipFinished( CarriedTagCount, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return not IsGameTypeEqualToString( "clean" )
			end
		}
	} )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CarriedTagCount:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
