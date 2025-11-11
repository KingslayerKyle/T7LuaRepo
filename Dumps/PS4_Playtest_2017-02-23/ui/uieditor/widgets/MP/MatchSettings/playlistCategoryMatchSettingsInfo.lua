require( "ui.uieditor.widgets.MP.MatchSettings.matchSettingsInfo" )

CoD.playlistCategoryMatchSettingsInfo = InheritFrom( LUI.UIElement )
CoD.playlistCategoryMatchSettingsInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.playlistCategoryMatchSettingsInfo )
	self.id = "playlistCategoryMatchSettingsInfo"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 675 )
	self:setTopBottom( 0, 0, 0, 825 )
	self.anyChildUsesUpdateState = true
	
	local categoryInfo = CoD.matchSettingsInfo.new( menu, controller )
	categoryInfo:mergeStateConditions( {
		{
			stateName = "AspectRatio_1x1",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	categoryInfo:setLeftRight( 0, 0, 0.5, 675.5 )
	categoryInfo:setTopBottom( 0, 0, -0.5, 824.5 )
	categoryInfo.FRBestTime.BestTimeValueText:setText( Engine.Localize( "--:--:--" ) )
	categoryInfo:linkToElementModel( self, nil, false, function ( model )
		categoryInfo:setModel( model, controller )
	end )
	self:addElement( categoryInfo )
	self.categoryInfo = categoryInfo
	
	local playlistCount = LUI.UITightText.new()
	playlistCount:setLeftRight( 0, 0, 1, 669 )
	playlistCount:setTopBottom( 0, 0, -33, -3 )
	playlistCount:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	playlistCount:linkToElementModel( self, "playlistCount", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			playlistCount:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( playlistCount )
	self.playlistCount = playlistCount
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.categoryInfo:close()
		self.playlistCount:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

