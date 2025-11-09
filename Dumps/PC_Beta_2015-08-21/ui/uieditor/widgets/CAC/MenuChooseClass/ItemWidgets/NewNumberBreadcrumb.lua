CoD.NewNumberBreadcrumb = InheritFrom( LUI.UIElement )
CoD.NewNumberBreadcrumb.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.NewNumberBreadcrumb )
	self.id = "NewNumberBreadcrumb"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 16 )
	self:setTopBottom( true, false, 0, 16 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, true, 0, 0 )
	bg:setTopBottom( true, true, 0, 0 )
	bg:setRGB( 0.74, 0.84, 0.24 )
	self:addElement( bg )
	self.bg = bg
	
	local numberNew = LUI.UIText.new()
	numberNew:setLeftRight( false, false, -8, 8 )
	numberNew:setTopBottom( true, false, 0, 16 )
	numberNew:setRGB( 0, 0, 0 )
	numberNew:setText( Engine.Localize( "2" ) )
	numberNew:setTTF( "fonts/default.ttf" )
	numberNew:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	numberNew:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( numberNew )
	self.numberNew = numberNew
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )
				numberNew:completeAnimation()
				self.numberNew:setAlpha( 0 )
				self.clipFinished( numberNew, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				bg:completeAnimation()
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )
				numberNew:completeAnimation()
				self.numberNew:setAlpha( 1 )
				self.clipFinished( numberNew, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f4_local0 = IsCurrentMenu( menu, "CustomClass" )
				if f4_local0 then
					f4_local0 = IsCACAnyLoadoutSlotNew( element, controller )
					if f4_local0 then
						f4_local0 = AlwaysFalse()
					end
				end
				return f4_local0
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

