require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_Subtitle_BG" )

CoD.TitleWidgetSmall = InheritFrom( LUI.UIElement )
CoD.TitleWidgetSmall.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TitleWidgetSmall )
	self.id = "TitleWidgetSmall"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 88 )
	self:setTopBottom( true, false, 0, 22 )
	self.anyChildUsesUpdateState = true
	
	local StartMenuIdentitySubtitleBG0 = CoD.StartMenu_Identity_Subtitle_BG.new( menu, controller )
	StartMenuIdentitySubtitleBG0:setLeftRight( true, true, -8, 8 )
	StartMenuIdentitySubtitleBG0:setTopBottom( true, true, -2, 2 )
	StartMenuIdentitySubtitleBG0:setRGB( 0, 0, 0 )
	StartMenuIdentitySubtitleBG0:setAlpha( 0.55 )
	self:addElement( StartMenuIdentitySubtitleBG0 )
	self.StartMenuIdentitySubtitleBG0 = StartMenuIdentitySubtitleBG0
	
	local SubTitle = LUI.UITightText.new()
	SubTitle:setLeftRight( false, false, -37, 37 )
	SubTitle:setTopBottom( true, false, 0.5, 21.5 )
	SubTitle:setText( Engine.Localize( "SOMETHING" ) )
	SubTitle:setTTF( "fonts/escom.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( SubTitle, "setText", function ( element, controller )
		ScaleWidgetToLabelCentered( self, element, 5 )
	end )
	self:addElement( SubTitle )
	self.SubTitle = SubTitle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				SubTitle:completeAnimation()
				self.SubTitle:setAlpha( 0 )
				self.clipFinished( SubTitle, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuIdentitySubtitleBG0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

