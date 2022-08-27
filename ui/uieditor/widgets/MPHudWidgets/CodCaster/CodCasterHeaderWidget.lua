-- b050cfde4b4cd908871cb0d42f600419
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CodCaster.CodCasterHeaderTeamBased" )
require( "ui.uieditor.widgets.CodCaster.CodCasterHeaderNonTeamBased" )

CoD.CodCasterHeaderWidget = InheritFrom( LUI.UIElement )
CoD.CodCasterHeaderWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CodCasterHeaderWidget )
	self.id = "CodCasterHeaderWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 561 )
	self:setTopBottom( true, false, 0, 131 )
	self.anyChildUsesUpdateState = true
	
	local CodCasterHeaderTeamBased = CoD.CodCasterHeaderTeamBased.new( menu, controller )
	CodCasterHeaderTeamBased:setLeftRight( false, false, -296, 295 )
	CodCasterHeaderTeamBased:setTopBottom( true, false, -2, 130 )
	self:addElement( CodCasterHeaderTeamBased )
	self.CodCasterHeaderTeamBased = CodCasterHeaderTeamBased
	
	local CodCasterHeaderNonTeamBased = CoD.CodCasterHeaderNonTeamBased.new( menu, controller )
	CodCasterHeaderNonTeamBased:setLeftRight( false, false, -297, 294 )
	CodCasterHeaderNonTeamBased:setTopBottom( true, false, -5, 126 )
	self:addElement( CodCasterHeaderNonTeamBased )
	self.CodCasterHeaderNonTeamBased = CodCasterHeaderNonTeamBased
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				CodCasterHeaderTeamBased:completeAnimation()
				self.CodCasterHeaderTeamBased:setAlpha( 0 )
				self.clipFinished( CodCasterHeaderTeamBased, {} )
				CodCasterHeaderNonTeamBased:completeAnimation()
				self.CodCasterHeaderNonTeamBased:setAlpha( 0 )
				self.clipFinished( CodCasterHeaderNonTeamBased, {} )
			end
		},
		VisibleTeamBased = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				CodCasterHeaderTeamBased:completeAnimation()
				self.CodCasterHeaderTeamBased:setAlpha( 1 )
				self.clipFinished( CodCasterHeaderTeamBased, {} )
				CodCasterHeaderNonTeamBased:completeAnimation()
				self.CodCasterHeaderNonTeamBased:setAlpha( 0 )
				self.clipFinished( CodCasterHeaderNonTeamBased, {} )
			end
		},
		VisibleNonTeamBased = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				CodCasterHeaderTeamBased:completeAnimation()
				self.CodCasterHeaderTeamBased:setAlpha( 0 )
				self.clipFinished( CodCasterHeaderTeamBased, {} )
				CodCasterHeaderNonTeamBased:completeAnimation()
				self.CodCasterHeaderNonTeamBased:setAlpha( 1 )
				self.clipFinished( CodCasterHeaderNonTeamBased, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "VisibleTeamBased",
			condition = function ( menu, element, event )
				local f5_local0 = IsCodCasterProfileValueEqualTo( controller, "shoutcaster_qs_scorepanel", 1 )
				if f5_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
						f5_local0 = IsGametypeTeambased()
						if not f5_local0 then
							f5_local0 = IsGameTypeEqualToString( "infect" )
						end
					else
						f5_local0 = false
					end
				end
				return f5_local0
			end
		},
		{
			stateName = "VisibleNonTeamBased",
			condition = function ( menu, element, event )
				local f6_local0 = IsCodCasterProfileValueEqualTo( controller, "shoutcaster_qs_scorepanel", 1 )
				if f6_local0 then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
						f6_local0 = not IsGametypeTeambased()
					else
						f6_local0 = false
					end
				end
				return f6_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.profileSettingsUpdated"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CodCasterHeaderTeamBased:close()
		element.CodCasterHeaderNonTeamBased:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

