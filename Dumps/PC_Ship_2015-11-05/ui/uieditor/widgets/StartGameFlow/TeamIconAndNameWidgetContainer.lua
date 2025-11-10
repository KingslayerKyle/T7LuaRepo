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
	self:setLeftRight( true, false, 0, 345 )
	self:setTopBottom( true, false, 0, 85 )
	self.anyChildUsesUpdateState = true
	
	local TeamIconAndNameWidget = CoD.TeamIconAndNameWidget.new( menu, controller )
	TeamIconAndNameWidget:setLeftRight( true, false, 0, 345 )
	TeamIconAndNameWidget:setTopBottom( true, false, 0, 85 )
	TeamIconAndNameWidget.FactionName:setText( Engine.Localize( "SPEC OPS" ) )
	self:addElement( TeamIconAndNameWidget )
	self.TeamIconAndNameWidget = TeamIconAndNameWidget
	
	local TeamIconAndNameWidgetForCodCaster = CoD.TeamIconAndNameWidgetForCodCaster.new( menu, controller )
	TeamIconAndNameWidgetForCodCaster:setLeftRight( true, false, -54.5, 387.5 )
	TeamIconAndNameWidgetForCodCaster:setTopBottom( true, false, 0, 85 )
	TeamIconAndNameWidgetForCodCaster.FactionName:setText( Engine.Localize( "WWWWWWWWWWWW" ) )
	self:addElement( TeamIconAndNameWidgetForCodCaster )
	self.TeamIconAndNameWidgetForCodCaster = TeamIconAndNameWidgetForCodCaster
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				TeamIconAndNameWidget:completeAnimation()
				self.TeamIconAndNameWidget:setAlpha( 1 )
				self.clipFinished( TeamIconAndNameWidget, {} )
				TeamIconAndNameWidgetForCodCaster:completeAnimation()
				self.TeamIconAndNameWidgetForCodCaster:setAlpha( 0 )
				self.clipFinished( TeamIconAndNameWidgetForCodCaster, {} )
			end,
			StreakEdit = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		CodCaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				TeamIconAndNameWidget:completeAnimation()
				self.TeamIconAndNameWidget:setAlpha( 0 )
				self.clipFinished( TeamIconAndNameWidget, {} )
				TeamIconAndNameWidgetForCodCaster:completeAnimation()
				self.TeamIconAndNameWidgetForCodCaster:setAlpha( 1 )
				self.clipFinished( TeamIconAndNameWidgetForCodCaster, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TeamIconAndNameWidget:close()
		element.TeamIconAndNameWidgetForCodCaster:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

