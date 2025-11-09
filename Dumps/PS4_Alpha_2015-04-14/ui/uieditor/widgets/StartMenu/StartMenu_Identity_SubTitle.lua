require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_Subtitle_BG" )

CoD.StartMenu_Identity_SubTitle = InheritFrom( LUI.UIElement )
CoD.StartMenu_Identity_SubTitle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Identity_SubTitle )
	self.id = "StartMenu_Identity_SubTitle"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 88 )
	self:setTopBottom( true, false, 0, 25 )
	self.anyChildUsesUpdateState = true
	
	local StartMenuIdentitySubtitleBG0 = CoD.StartMenu_Identity_Subtitle_BG.new( menu, controller )
	StartMenuIdentitySubtitleBG0:setLeftRight( true, true, -8, 8 )
	StartMenuIdentitySubtitleBG0:setTopBottom( true, true, 0, 0 )
	StartMenuIdentitySubtitleBG0:setRGB( 0, 0, 0 )
	StartMenuIdentitySubtitleBG0:setAlpha( 0.55 )
	self:addElement( StartMenuIdentitySubtitleBG0 )
	self.StartMenuIdentitySubtitleBG0 = StartMenuIdentitySubtitleBG0
	
	local SubTitle = LUI.UITightText.new()
	SubTitle:setLeftRight( true, false, 8, 82 )
	SubTitle:setTopBottom( true, false, 2, 22.5 )
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
	self.close = function ( self )
		self.StartMenuIdentitySubtitleBG0:close()
		CoD.StartMenu_Identity_SubTitle.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

