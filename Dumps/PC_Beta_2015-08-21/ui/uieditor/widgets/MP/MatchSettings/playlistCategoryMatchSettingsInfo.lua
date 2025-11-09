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
	self:setLeftRight( true, false, 0, 343 )
	self:setTopBottom( true, false, 0, 508 )
	self.anyChildUsesUpdateState = true
	
	local categoryInfo = CoD.matchSettingsInfo.new( menu, controller )
	categoryInfo:setLeftRight( true, false, 0, 340 )
	categoryInfo:setTopBottom( true, false, 0, 508 )
	categoryInfo:linkToElementModel( self, nil, false, function ( model )
		categoryInfo:setModel( model, controller )
	end )
	categoryInfo:mergeStateConditions( {
		{
			stateName = "AspectRatio_1x1",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( categoryInfo )
	self.categoryInfo = categoryInfo
	
	local playlistCount = LUI.UITightText.new()
	playlistCount:setLeftRight( true, false, 1, 344 )
	playlistCount:setTopBottom( false, true, -530, -510 )
	playlistCount:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	playlistCount:linkToElementModel( self, "playlistCount", true, function ( model )
		local _playlistCount = Engine.GetModelValue( model )
		if _playlistCount then
			playlistCount:setText( Engine.Localize( _playlistCount ) )
		end
	end )
	self:addElement( playlistCount )
	self.playlistCount = playlistCount
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.categoryInfo:close()
		element.playlistCount:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

