require( "ui.uieditor.widgets.StartGameFlow.TeamIconAndNameWidget" )
require( "ui.uieditor.widgets.StartGameFlow.TeamIconAndNameWidgetForCodCaster" )

CoD.TeamIconAndNameWidgetContainer = InheritFrom( LUI.UIElement )
CoD.TeamIconAndNameWidgetContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TeamIconAndNameWidgetContainer )
	self.id = "TeamIconAndNameWidgetContainer"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 517 )
	self:setTopBottom( 0, 0, 0, 127 )
	
	local TeamIconAndNameWidget = CoD.TeamIconAndNameWidget.new( menu, controller )
	TeamIconAndNameWidget:setLeftRight( 0, 0, 0, 518 )
	TeamIconAndNameWidget:setTopBottom( 0, 0, 0, 128 )
	self:addElement( TeamIconAndNameWidget )
	self.TeamIconAndNameWidget = TeamIconAndNameWidget
	
	local TeamIconAndNameWidgetForCodCaster = CoD.TeamIconAndNameWidgetForCodCaster.new( menu, controller )
	TeamIconAndNameWidgetForCodCaster:setLeftRight( 0, 0, -81.5, 581.5 )
	TeamIconAndNameWidgetForCodCaster:setTopBottom( 0, 0, 0, 128 )
	self:addElement( TeamIconAndNameWidgetForCodCaster )
	self.TeamIconAndNameWidgetForCodCaster = TeamIconAndNameWidgetForCodCaster
	
	self.resetProperties = function ()
		TeamIconAndNameWidgetForCodCaster:completeAnimation()
		TeamIconAndNameWidget:completeAnimation()
		TeamIconAndNameWidgetForCodCaster:setAlpha( 1 )
		TeamIconAndNameWidget:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				TeamIconAndNameWidgetForCodCaster:completeAnimation()
				self.TeamIconAndNameWidgetForCodCaster:setAlpha( 0 )
				self.clipFinished( TeamIconAndNameWidgetForCodCaster, {} )
			end,
			StreakEdit = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		CodCaster = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				TeamIconAndNameWidget:completeAnimation()
				self.TeamIconAndNameWidget:setAlpha( 0 )
				self.clipFinished( TeamIconAndNameWidget, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "CodCaster",
			condition = function ( menu, element, event )
				return IsCodCaster( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "factions.isCoDCaster" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "factions.isCoDCaster"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TeamIconAndNameWidget:close()
		self.TeamIconAndNameWidgetForCodCaster:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

