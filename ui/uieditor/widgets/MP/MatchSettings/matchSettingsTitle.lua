-- 863fff16b4515e35e29075205e939eea
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Scorestreaks.scorestreaks_TitleBox" )

CoD.matchSettingsTitle = InheritFrom( LUI.UIElement )
CoD.matchSettingsTitle.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.matchSettingsTitle )
	self.id = "matchSettingsTitle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 449 )
	self:setTopBottom( true, false, 0, 35 )
	
	local TitleBox = CoD.scorestreaks_TitleBox.new( menu, controller )
	TitleBox:setLeftRight( true, false, 2, 451 )
	TitleBox:setTopBottom( true, false, 0, 35 )
	TitleBox:linkToElementModel( self, "text", true, function ( model )
		local text = Engine.GetModelValue( model )
		if text then
			TitleBox.ScorestreaksLabel:setText( Engine.Localize( text ) )
		end
	end )
	self:addElement( TitleBox )
	self.TitleBox = TitleBox
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TitleBox:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
