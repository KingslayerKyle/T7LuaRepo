require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_Subtitle_BG" )

CoD.MapVoteLabelLower = InheritFrom( LUI.UIElement )
CoD.MapVoteLabelLower.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MapVoteLabelLower )
	self.id = "MapVoteLabelLower"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 90 )
	self:setTopBottom( true, false, 0, 18 )
	self.anyChildUsesUpdateState = true
	
	local StartMenuIdentitySubtitleBG00 = CoD.StartMenu_Identity_Subtitle_BG.new( menu, controller )
	StartMenuIdentitySubtitleBG00:setLeftRight( true, true, -7, 8 )
	StartMenuIdentitySubtitleBG00:setTopBottom( true, true, -2, 2 )
	StartMenuIdentitySubtitleBG00:setRGB( 0, 0, 0 )
	StartMenuIdentitySubtitleBG00:setAlpha( 0.55 )
	self:addElement( StartMenuIdentitySubtitleBG00 )
	self.StartMenuIdentitySubtitleBG00 = StartMenuIdentitySubtitleBG00
	
	local SubTitle = LUI.UITightText.new()
	SubTitle:setLeftRight( true, false, 5, 79 )
	SubTitle:setTopBottom( true, false, -1, 16.8 )
	SubTitle:setRGB( 1, 1, 1 )
	SubTitle:setText( Engine.Localize( "SOMETHING" ) )
	SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( SubTitle, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( SubTitle )
	self.SubTitle = SubTitle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self.close = function ( self )
		self.StartMenuIdentitySubtitleBG00:close()
		CoD.MapVoteLabelLower.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

