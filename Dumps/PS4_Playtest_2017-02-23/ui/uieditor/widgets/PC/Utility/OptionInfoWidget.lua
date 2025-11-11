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
	self:setLeftRight( 0, 0, 0, 600 )
	self:setTopBottom( 0, 0, 0, 450 )
	
	local description = LUI.UIText.new()
	description:setLeftRight( 0, 1, 16, 0 )
	description:setTopBottom( 0, 0, 67, 105 )
	description:setRGB( 0.74, 0.74, 0.74 )
	description:setText( Engine.Localize( "MENU_NEW" ) )
	description:setTTF( "fonts/default.ttf" )
	description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( description, "setText", function ( element, text )
		SetStateFromText( self, element, "DefaultState", "Hidden" )
	end )
	self:addElement( description )
	self.description = description
	
	local title = CoD.TitleTextWidget.new( menu, controller )
	title:setLeftRight( 0, 0, 0, 600 )
	title:setTopBottom( 0, 0, 0.5, 51.5 )
	title.itemName:setText( Engine.Localize( "MENU_NEW" ) )
	self:addElement( title )
	self.title = title
	
	self.resetProperties = function ()
		title:completeAnimation()
		description:completeAnimation()
		title:setAlpha( 1 )
		description:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.title:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

