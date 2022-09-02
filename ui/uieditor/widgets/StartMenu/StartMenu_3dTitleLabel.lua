-- 2bd7d10c9b45118213b0343c70698f67
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 910 )
	self:setTopBottom( true, false, 0, 51 )
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 4.38, 910 )
	Label0:setTopBottom( true, false, 4, 52 )
	Label0:setRGB( 0.87, 0.9, 0.9 )
	Label0:setText( Engine.Localize( "WILDCARDS" ) )
	Label0:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Label0:setLetterSpacing( -2.2 )

	LUI.OverrideFunction_CallOriginalFirst( Label0, "setText", function ( element, controller )
		if not IsCurrentMenu( menu, "ModeSelect" ) then
			ScaleParentWidgetToLabel( self, element, 0 )
		end
	end )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 910 )
	Image0:setTopBottom( true, false, 26, 27 )
	Image0:setRGB( 0, 0, 0 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 910, 914 )
	Image1:setTopBottom( true, false, -32.75, 95.25 )
	Image1:setRGB( 0, 0, 0 )
	Image1:setAlpha( 0 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Label0:completeAnimation()
				self.Label0:setAlpha( 1 )
				self.clipFinished( Label0, {} )
			end
		},
		LogoVisible = {
			DefaultClip = function ()
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

