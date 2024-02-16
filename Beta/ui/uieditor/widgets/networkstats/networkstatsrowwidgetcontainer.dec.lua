require( "ui.uieditor.widgets.NetworkStats.NetworkStatsRowWidget" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )

CoD.NetworkStatsRowWidgetContainer = InheritFrom( LUI.UIElement )
CoD.NetworkStatsRowWidgetContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.NetworkStatsRowWidgetContainer )
	self.id = "NetworkStatsRowWidgetContainer"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 256 )
	self:setTopBottom( true, false, 0, 150 )
	self.anyChildUsesUpdateState = true
	
	local NetworkStatsRowWidget0 = CoD.NetworkStatsRowWidget.new( menu, controller )
	NetworkStatsRowWidget0:setLeftRight( true, false, 0, 257 )
	NetworkStatsRowWidget0:setTopBottom( true, false, 0, 150 )
	self:addElement( NetworkStatsRowWidget0 )
	self.NetworkStatsRowWidget0 = NetworkStatsRowWidget0
	
	local cacButtonBoxLrgInactiveStroke0 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	cacButtonBoxLrgInactiveStroke0:setLeftRight( true, true, -1.77, 1 )
	cacButtonBoxLrgInactiveStroke0:setTopBottom( true, true, 0, 0 )
	self:addElement( cacButtonBoxLrgInactiveStroke0 )
	self.cacButtonBoxLrgInactiveStroke0 = cacButtonBoxLrgInactiveStroke0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				NetworkStatsRowWidget0:completeAnimation()
				self.NetworkStatsRowWidget0:setAlpha( 1 )
				self.clipFinished( NetworkStatsRowWidget0, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				NetworkStatsRowWidget0:completeAnimation()
				self.NetworkStatsRowWidget0:setAlpha( 0 )
				self.clipFinished( NetworkStatsRowWidget0, {} )
			end
		},
		Demo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				NetworkStatsRowWidget0:completeAnimation()
				self.NetworkStatsRowWidget0:setAlpha( 0 )
				self.clipFinished( NetworkStatsRowWidget0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsMultiplayer()
			end
		},
		{
			stateName = "Demo",
			condition = function ( menu, element, event )
				return IsBooleanDvarSet( "ui_execdemo" )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.NetworkStatsRowWidget0:close()
		self.cacButtonBoxLrgInactiveStroke0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

