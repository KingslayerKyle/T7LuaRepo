require( "ui.uieditor.widgets.PC.Utility.TitleTextWidget" )

CoD.OptionInfoWidget = InheritFrom( LUI.UIElement )
CoD.OptionInfoWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.OptionInfoWidget )
	self.id = "OptionInfoWidget"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 300 )
	self.anyChildUsesUpdateState = true
	
	local description = LUI.UIText.new()
	description:setLeftRight( true, true, 10, 0 )
	description:setTopBottom( true, false, 45, 70 )
	description:setRGB( 0.74, 0.74, 0.74 )
	description:setText( Engine.Localize( "MENU_NEW" ) )
	description:setTTF( "fonts/default.ttf" )
	description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( description, "setText", function ( element, controller )
		SetStateFromText( self, element, "DefaultState", "Hidden" )
	end )
	self:addElement( description )
	self.description = description
	
	local title = CoD.TitleTextWidget.new( menu, controller )
	title:setLeftRight( true, false, 0, 400 )
	title:setTopBottom( true, false, 0, 34 )
	title.itemName:setText( Engine.Localize( "MENU_NEW" ) )
	self:addElement( title )
	self.title = title
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				description:completeAnimation()
				self.description:setAlpha( 1 )
				self.clipFinished( description, {} )
				title:completeAnimation()
				self.title:setAlpha( 1 )
				self.clipFinished( title, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				description:completeAnimation()
				self.description:setAlpha( 0 )
				self.clipFinished( description, {} )
				title:completeAnimation()
				self.title:setAlpha( 0 )
				self.clipFinished( title, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.title:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

