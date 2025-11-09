LUI.createMenu.HunterPatrolSightingMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "HunterPatrolSightingMenu" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local HunterPatrolTitle = LUI.UIText.new()
	HunterPatrolTitle:setLeftRight( true, false, 1020, 1216 )
	HunterPatrolTitle:setTopBottom( true, false, 403.25, 422.25 )
	HunterPatrolTitle:setRGB( 1, 1, 1 )
	HunterPatrolTitle:setTTF( "fonts/UnitedSansSmCdBd_0.ttf" )
	HunterPatrolTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	HunterPatrolTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( HunterPatrolTitle )
	self.HunterPatrolTitle = HunterPatrolTitle
	
	local HunterImage = LUI.UIImage.new()
	HunterImage:setLeftRight( true, false, 1095, 1177 )
	HunterImage:setTopBottom( true, false, 298.92, 385 )
	HunterImage:setRGB( 0.59, 0.6, 0.6 )
	HunterImage:setImage( RegisterImage( "uie_t7_hud_boss_hunter" ) )
	HunterImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( HunterImage )
	self.HunterImage = HunterImage
	
	local HunterPatrolSightIndicator = LUI.UIImage.new()
	HunterPatrolSightIndicator:setLeftRight( true, false, 1020, 1156 )
	HunterPatrolSightIndicator:setTopBottom( true, false, 422.25, 537.85 )
	HunterPatrolSightIndicator:setRGB( 1, 0, 0.07 )
	HunterPatrolSightIndicator:setImage( RegisterImage( "uie_img_t7_hud_cm_herobackingglow" ) )
	HunterPatrolSightIndicator:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( HunterPatrolSightIndicator )
	self.HunterPatrolSightIndicator = HunterPatrolSightIndicator
	
	self.HunterPatrolTitle:linkToElementModel( self, "hunter_patrol_sight_title", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			HunterPatrolTitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.HunterPatrolSightIndicator:linkToElementModel( self, "hunter_patrol_sight_alpha", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			HunterPatrolSightIndicator:setAlpha( modelValue )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				local HunterPatrolTitleFrame2 = function ( HunterPatrolTitle, event )
					local HunterPatrolTitleFrame3 = function ( HunterPatrolTitle, event )
						if not event.interrupted then
							HunterPatrolTitle:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						end
						HunterPatrolTitle:setLeftRight( true, false, 1020, 1216 )
						HunterPatrolTitle:setTopBottom( true, false, 403.25, 422.25 )
						if event.interrupted then
							self.clipFinished( HunterPatrolTitle, event )
						else
							HunterPatrolTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						HunterPatrolTitleFrame3( HunterPatrolTitle, event )
						return 
					else
						HunterPatrolTitle:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
						HunterPatrolTitle:registerEventHandler( "transition_complete_keyframe", HunterPatrolTitleFrame3 )
					end
				end
				
				HunterPatrolTitle:completeAnimation()
				self.HunterPatrolTitle:setLeftRight( true, false, 818, 1014 )
				self.HunterPatrolTitle:setTopBottom( true, false, 201, 220 )
				HunterPatrolTitleFrame2( HunterPatrolTitle, {} )
				local HunterImageFrame2 = function ( HunterImage, event )
					local HunterImageFrame3 = function ( HunterImage, event )
						local HunterImageFrame4 = function ( HunterImage, event )
							local HunterImageFrame5 = function ( HunterImage, event )
								local HunterImageFrame6 = function ( HunterImage, event )
									if not event.interrupted then
										HunterImage:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
									end
									HunterImage:setLeftRight( true, false, 1095, 1177 )
									HunterImage:setTopBottom( true, false, 298.92, 385 )
									HunterImage:setRGB( 0.59, 0.6, 0.6 )
									HunterImage:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( HunterImage, event )
									else
										HunterImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									HunterImageFrame6( HunterImage, event )
									return 
								else
									HunterImage:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
									HunterImage:setAlpha( 1 )
									HunterImage:registerEventHandler( "transition_complete_keyframe", HunterImageFrame6 )
								end
							end
							
							if event.interrupted then
								HunterImageFrame5( HunterImage, event )
								return 
							else
								HunterImage:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								HunterImage:setAlpha( 0 )
								HunterImage:registerEventHandler( "transition_complete_keyframe", HunterImageFrame5 )
							end
						end
						
						if event.interrupted then
							HunterImageFrame4( HunterImage, event )
							return 
						else
							HunterImage:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							HunterImage:setAlpha( 1 )
							HunterImage:registerEventHandler( "transition_complete_keyframe", HunterImageFrame4 )
						end
					end
					
					if event.interrupted then
						HunterImageFrame3( HunterImage, event )
						return 
					else
						HunterImage:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						HunterImage:registerEventHandler( "transition_complete_keyframe", HunterImageFrame3 )
					end
				end
				
				HunterImage:completeAnimation()
				self.HunterImage:setLeftRight( true, false, 852, 1006 )
				self.HunterImage:setTopBottom( true, false, 65, 201 )
				self.HunterImage:setRGB( 0.59, 0.6, 0.6 )
				self.HunterImage:setAlpha( 0 )
				HunterImageFrame2( HunterImage, {} )
				local HunterPatrolSightIndicatorFrame2 = function ( HunterPatrolSightIndicator, event )
					local HunterPatrolSightIndicatorFrame3 = function ( HunterPatrolSightIndicator, event )
						if not event.interrupted then
							HunterPatrolSightIndicator:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						end
						HunterPatrolSightIndicator:setLeftRight( true, false, 1020, 1156 )
						HunterPatrolSightIndicator:setTopBottom( true, false, 422.25, 537.85 )
						if event.interrupted then
							self.clipFinished( HunterPatrolSightIndicator, event )
						else
							HunterPatrolSightIndicator:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						HunterPatrolSightIndicatorFrame3( HunterPatrolSightIndicator, event )
						return 
					else
						HunterPatrolSightIndicator:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
						HunterPatrolSightIndicator:registerEventHandler( "transition_complete_keyframe", HunterPatrolSightIndicatorFrame3 )
					end
				end
				
				HunterPatrolSightIndicator:completeAnimation()
				self.HunterPatrolSightIndicator:setLeftRight( true, false, 804, 940 )
				self.HunterPatrolSightIndicator:setTopBottom( true, false, 234, 349.6 )
				HunterPatrolSightIndicatorFrame2( HunterPatrolSightIndicator, {} )
			end
		}
	}
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	self.close = function ( self )
		self.HunterPatrolTitle:close()
		self.HunterPatrolSightIndicator:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

