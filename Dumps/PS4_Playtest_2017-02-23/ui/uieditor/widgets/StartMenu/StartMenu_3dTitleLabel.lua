CoD.StartMenu_3dTitleLabel = InheritFrom( LUI.UIElement )
CoD.StartMenu_3dTitleLabel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_3dTitleLabel )
	self.id = "StartMenu_3dTitleLabel"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1365 )
	self:setTopBottom( 0, 0, 0, 76 )
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( 0, 0, 7, 1365 )
	Label0:setTopBottom( 0, 0, 6, 78 )
	Label0:setRGB( 0.87, 0.9, 0.9 )
	Label0:setText( Engine.Localize( "WILDCARDS" ) )
	Label0:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Label0:setLetterSpacing( -2.2 )
	LUI.OverrideFunction_CallOriginalFirst( Label0, "setText", function ( element, text )
		if not IsCurrentMenu( menu, "ModeSelect" ) then
			ScaleParentWidgetToLabel( self, element, 0 )
		end
	end )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 0, 1365 )
	Image0:setTopBottom( 0, 0, 39, 41 )
	Image0:setRGB( 0, 0, 0 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 0, 0, 1365, 1371 )
	Image1:setTopBottom( 0, 0, -49, 143 )
	Image1:setRGB( 0, 0, 0 )
	Image1:setAlpha( 0 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	self.resetProperties = function ()
		Label0:completeAnimation()
		Label0:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		LogoVisible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Label0:completeAnimation()
				self.Label0:setAlpha( 0 )
				self.clipFinished( Label0, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

