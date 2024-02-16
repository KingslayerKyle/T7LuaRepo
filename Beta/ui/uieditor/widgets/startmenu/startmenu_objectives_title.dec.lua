require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.Startmenu_Objectives_Title = InheritFrom( LUI.UIElement )
CoD.Startmenu_Objectives_Title.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Startmenu_Objectives_Title )
	self.id = "Startmenu_Objectives_Title"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 352 )
	self:setTopBottom( true, false, 0, 50 )
	
	local glow = CoD.cac_ItemTitleGlow.new( menu, controller )
	glow:setLeftRight( true, true, 0, 0 )
	glow:setTopBottom( true, true, 0, 0 )
	glow:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( glow )
	self.glow = glow
	
	local title = LUI.UIText.new()
	title:setLeftRight( true, true, 0, 0 )
	title:setTopBottom( true, false, 6, 44 )
	title:setRGB( 0, 0, 0 )
	title:setText( Engine.Localize( "MENU_MISSIONOBJECTIVES_CAPS" ) )
	title:setTTF( "fonts/escom.ttf" )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( title )
	self.title = title
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				title:completeAnimation()
				self.title:setAlpha( 1 )
				self.clipFinished( title, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				title:completeAnimation()
				self.title:setAlpha( 0 )
				self.clipFinished( title, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.glow:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

