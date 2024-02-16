-- 4d91204e359e4c63b0103d5cbae55756
-- This hash is used for caching, delete to decompile the file again

CoD.Pregame_FactionTeamColorBarHeader = InheritFrom( LUI.UIElement )
CoD.Pregame_FactionTeamColorBarHeader.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Pregame_FactionTeamColorBarHeader )
	self.id = "Pregame_FactionTeamColorBarHeader"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 3 )
	
	local AxisColor = LUI.UIImage.new()
	AxisColor:setLeftRight( true, true, 0, 0 )
	AxisColor:setTopBottom( true, false, 0, 2.98 )
	AxisColor:subscribeToGlobalModel( controller, "Factions", "axisFactionColor", function ( model )
		local axisFactionColor = Engine.GetModelValue( model )
		if axisFactionColor then
			AxisColor:setRGB( axisFactionColor )
		end
	end )
	self:addElement( AxisColor )
	self.AxisColor = AxisColor
	
	local AlliesColor = LUI.UIImage.new()
	AlliesColor:setLeftRight( true, true, 0, 0 )
	AlliesColor:setTopBottom( true, false, 0, 2.98 )
	AlliesColor:subscribeToGlobalModel( controller, "Factions", "alliesFactionColor", function ( model )
		local alliesFactionColor = Engine.GetModelValue( model )
		if alliesFactionColor then
			AlliesColor:setRGB( alliesFactionColor )
		end
	end )
	self:addElement( AlliesColor )
	self.AlliesColor = AlliesColor
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				AxisColor:completeAnimation()
				self.AxisColor:setAlpha( 0 )
				self.clipFinished( AxisColor, {} )

				AlliesColor:completeAnimation()
				self.AlliesColor:setAlpha( 0 )
				self.clipFinished( AlliesColor, {} )
			end
		},
		IfAxisTeam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				AxisColor:completeAnimation()
				self.AxisColor:setAlpha( 1 )
				self.clipFinished( AxisColor, {} )

				AlliesColor:completeAnimation()
				self.AlliesColor:setAlpha( 0 )
				self.clipFinished( AlliesColor, {} )
			end
		},
		IfAlliesTeam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				AxisColor:completeAnimation()
				self.AxisColor:setAlpha( 0 )
				self.clipFinished( AxisColor, {} )

				AlliesColor:completeAnimation()
				self.AlliesColor:setAlpha( 1 )
				self.clipFinished( AlliesColor, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "IfAxisTeam",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "intData", Enum.team_t.TEAM_AXIS )
			end
		},
		{
			stateName = "IfAlliesTeam",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "intData", Enum.team_t.TEAM_ALLIES )
			end
		}
	} )
	self:linkToElementModel( self, "intData", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "intData"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AxisColor:close()
		element.AlliesColor:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
