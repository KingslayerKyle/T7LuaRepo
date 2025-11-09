CoD.AmmoWidget_EquipmentEmpty = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_EquipmentEmpty.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_EquipmentEmpty )
	self.id = "AmmoWidget_EquipmentEmpty"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 26 )
	self:setTopBottom( true, false, 0, 26 )
	
	local ImgIcon = LUI.UIImage.new()
	ImgIcon:setLeftRight( true, true, 0, 0 )
	ImgIcon:setTopBottom( true, true, 0, 0 )
	ImgIcon:setRGB( 1, 0, 0 )
	ImgIcon:setAlpha( 0.31 )
	ImgIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ImgIcon )
	self.ImgIcon = ImgIcon
	
	local ImgIconGrow = LUI.UIImage.new()
	ImgIconGrow:setLeftRight( true, true, -10.29, 10.29 )
	ImgIconGrow:setTopBottom( true, true, -10.29, 10.29 )
	ImgIconGrow:setRGB( 1, 0, 0 )
	ImgIconGrow:setAlpha( 0.31 )
	ImgIconGrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ImgIconGrow )
	self.ImgIconGrow = ImgIconGrow
	
	local EmptyFlash = LUI.UIImage.new()
	EmptyFlash:setLeftRight( false, false, -20.5, 20 )
	EmptyFlash:setTopBottom( false, false, -18.5, 18.5 )
	EmptyFlash:setRGB( 1, 0, 0 )
	EmptyFlash:setAlpha( 0.52 )
	EmptyFlash:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_inventoryboxempty" ) )
	EmptyFlash:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( EmptyFlash )
	self.EmptyFlash = EmptyFlash
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				ImgIcon:completeAnimation()
				self.ImgIcon:setLeftRight( true, true, 0, 0 )
				self.ImgIcon:setTopBottom( true, true, 0, 0 )
				self.ImgIcon:setAlpha( 0 )
				self.clipFinished( ImgIcon, {} )
				ImgIconGrow:completeAnimation()
				self.ImgIconGrow:setLeftRight( true, true, 0, 0 )
				self.ImgIconGrow:setTopBottom( true, true, 0, 0 )
				self.ImgIconGrow:setAlpha( 0 )
				self.clipFinished( ImgIconGrow, {} )
				EmptyFlash:completeAnimation()
				self.EmptyFlash:setAlpha( 0 )
				self.clipFinished( EmptyFlash, {} )
			end
		},
		Empty = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
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
					ImgIconGrow:setLeftRight( true, true, -15, 15 )
					ImgIconGrow:setTopBottom( true, true, -15, 15 )
					ImgIconGrow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ImgIconGrow, event )
					else
						ImgIconGrow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgIconGrow:completeAnimation()
				self.ImgIconGrow:setLeftRight( true, true, 0, 0 )
				self.ImgIconGrow:setTopBottom( true, true, 0, 0 )
				self.ImgIconGrow:setAlpha( 1 )
				ImgIconGrowFrame2( ImgIconGrow, {} )
				local EmptyFlashFrame2 = function ( EmptyFlash, event )
					local EmptyFlashFrame3 = function ( EmptyFlash, event )
						local EmptyFlashFrame4 = function ( EmptyFlash, event )
							local EmptyFlashFrame5 = function ( EmptyFlash, event )
								local EmptyFlashFrame6 = function ( EmptyFlash, event )
									local EmptyFlashFrame7 = function ( EmptyFlash, event )
										local EmptyFlashFrame8 = function ( EmptyFlash, event )
											local EmptyFlashFrame9 = function ( EmptyFlash, event )
												local EmptyFlashFrame10 = function ( EmptyFlash, event )
													local EmptyFlashFrame11 = function ( EmptyFlash, event )
														if not event.interrupted then
															EmptyFlash:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
														end
														EmptyFlash:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( EmptyFlash, event )
														else
															EmptyFlash:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														EmptyFlashFrame11( EmptyFlash, event )
														return 
													else
														EmptyFlash:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														EmptyFlash:setAlpha( 1 )
														EmptyFlash:registerEventHandler( "transition_complete_keyframe", EmptyFlashFrame11 )
													end
												end
												
												if event.interrupted then
													EmptyFlashFrame10( EmptyFlash, event )
													return 
												else
													EmptyFlash:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													EmptyFlash:registerEventHandler( "transition_complete_keyframe", EmptyFlashFrame10 )
												end
											end
											
											if event.interrupted then
												EmptyFlashFrame9( EmptyFlash, event )
												return 
											else
												EmptyFlash:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												EmptyFlash:setAlpha( 0.59 )
												EmptyFlash:registerEventHandler( "transition_complete_keyframe", EmptyFlashFrame9 )
											end
										end
										
										if event.interrupted then
											EmptyFlashFrame8( EmptyFlash, event )
											return 
										else
											EmptyFlash:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
											EmptyFlash:registerEventHandler( "transition_complete_keyframe", EmptyFlashFrame8 )
										end
									end
									
									if event.interrupted then
										EmptyFlashFrame7( EmptyFlash, event )
										return 
									else
										EmptyFlash:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										EmptyFlash:setAlpha( 1 )
										EmptyFlash:registerEventHandler( "transition_complete_keyframe", EmptyFlashFrame7 )
									end
								end
								
								if event.interrupted then
									EmptyFlashFrame6( EmptyFlash, event )
									return 
								else
									EmptyFlash:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									EmptyFlash:registerEventHandler( "transition_complete_keyframe", EmptyFlashFrame6 )
								end
							end
							
							if event.interrupted then
								EmptyFlashFrame5( EmptyFlash, event )
								return 
							else
								EmptyFlash:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								EmptyFlash:setAlpha( 0 )
								EmptyFlash:registerEventHandler( "transition_complete_keyframe", EmptyFlashFrame5 )
							end
						end
						
						if event.interrupted then
							EmptyFlashFrame4( EmptyFlash, event )
							return 
						else
							EmptyFlash:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							EmptyFlash:registerEventHandler( "transition_complete_keyframe", EmptyFlashFrame4 )
						end
					end
					
					if event.interrupted then
						EmptyFlashFrame3( EmptyFlash, event )
						return 
					else
						EmptyFlash:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						EmptyFlash:setAlpha( 1 )
						EmptyFlash:registerEventHandler( "transition_complete_keyframe", EmptyFlashFrame3 )
					end
				end
				
				EmptyFlash:completeAnimation()
				self.EmptyFlash:setAlpha( 0 )
				EmptyFlashFrame2( EmptyFlash, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

