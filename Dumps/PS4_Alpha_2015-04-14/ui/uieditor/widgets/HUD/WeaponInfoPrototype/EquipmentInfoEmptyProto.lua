CoD.EquipmentInfoEmptyProto = InheritFrom( LUI.UIElement )
CoD.EquipmentInfoEmptyProto.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EquipmentInfoEmptyProto )
	self.id = "EquipmentInfoEmptyProto"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 26 )
	self:setTopBottom( true, false, 0, 26 )
	
	local ImgIcon = LUI.UIImage.new()
	ImgIcon:setLeftRight( true, true, 0, 0 )
	ImgIcon:setTopBottom( true, true, 0, 0 )
	ImgIcon:setRGB( 1, 0, 0 )
	ImgIcon:setAlpha( 0 )
	ImgIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ImgIcon )
	self.ImgIcon = ImgIcon
	
	local ImgIconGrow = LUI.UIImage.new()
	ImgIconGrow:setLeftRight( true, true, 0, 0 )
	ImgIconGrow:setTopBottom( true, true, 0, 0 )
	ImgIconGrow:setRGB( 1, 0, 0 )
	ImgIconGrow:setAlpha( 0 )
	ImgIconGrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ImgIconGrow )
	self.ImgIconGrow = ImgIconGrow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ImgIcon:completeAnimation()
				self.ImgIcon:setAlpha( 0 )
				self.clipFinished( ImgIcon, {} )
				ImgIconGrow:completeAnimation()
				self.ImgIconGrow:setLeftRight( false, true, -34, 0 )
				self.ImgIconGrow:setTopBottom( false, true, -36.55, 0 )
				self.ImgIconGrow:setAlpha( 0 )
				self.clipFinished( ImgIconGrow, {} )
			end
		},
		Empty = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local ImgIconFrame2 = function ( ImgIcon, event )
					if not event.interrupted then
						ImgIcon:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
					end
					ImgIcon:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ImgIcon, event )
					else
						ImgIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgIcon:completeAnimation()
				self.ImgIcon:setAlpha( 1 )
				ImgIconFrame2( ImgIcon, {} )
				local ImgIconGrowFrame2 = function ( ImgIconGrow, event )
					if not event.interrupted then
						ImgIconGrow:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
					end
					ImgIconGrow:setLeftRight( false, true, -72, 23 )
					ImgIconGrow:setTopBottom( false, true, -83.57, 18.55 )
					ImgIconGrow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ImgIconGrow, event )
					else
						ImgIconGrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgIconGrow:completeAnimation()
				self.ImgIconGrow:setLeftRight( false, true, -34, 0 )
				self.ImgIconGrow:setTopBottom( false, true, -36.55, 0 )
				self.ImgIconGrow:setAlpha( 1 )
				ImgIconGrowFrame2( ImgIconGrow, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

