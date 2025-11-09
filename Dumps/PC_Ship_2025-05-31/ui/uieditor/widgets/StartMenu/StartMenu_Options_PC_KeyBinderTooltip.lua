CoD.StartMenu_Options_PC_KeyBinderTooltip = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_PC_KeyBinderTooltip.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_PC_KeyBinderTooltip )
	self.id = "StartMenu_Options_PC_KeyBinderTooltip"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 100 )
	
	local fullBacking = LUI.UIImage.new()
	fullBacking:setLeftRight( true, false, 0, 200 )
	fullBacking:setTopBottom( true, false, 0, 100 )
	fullBacking:setRGB( 0, 0, 0 )
	self:addElement( fullBacking )
	self.fullBacking = fullBacking
	
	local headerText = LUI.UIText.new()
	headerText:setLeftRight( true, false, 7.5, 200 )
	headerText:setTopBottom( true, false, 6.5, 31.5 )
	headerText:setText( Engine.Localize( "MENU_NEW" ) )
	headerText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	headerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	headerText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( headerText )
	self.headerText = headerText
	
	local descText = LUI.UIText.new()
	descText:setLeftRight( true, false, 7.5, 200 )
	descText:setTopBottom( true, false, 31.5, 51.5 )
	descText:setRGB( 0.78, 0.78, 0.78 )
	descText:setText( Engine.Localize( "MENU_NEW" ) )
	descText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	descText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	descText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( descText )
	self.descText = descText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				headerText:completeAnimation()
				self.headerText:setAlpha( 1 )
				self.clipFinished( headerText, {} )
				descText:completeAnimation()
				self.descText:setAlpha( 1 )
				self.clipFinished( descText, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				fullBacking:completeAnimation()
				self.fullBacking:setAlpha( 0 )
				self.clipFinished( fullBacking, {} )
				headerText:completeAnimation()
				self.headerText:setAlpha( 0 )
				self.clipFinished( headerText, {} )
				descText:completeAnimation()
				self.descText:setAlpha( 0 )
				self.clipFinished( descText, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not ShouldOpenGraphicsAndSoundOptions()
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

