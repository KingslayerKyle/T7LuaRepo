-- daa66be24af3ff0e13886fdcb42d1aa9
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_loot_Manga = InheritFrom( LUI.UIElement )
CoD.CallingCards_loot_Manga.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_loot_Manga )
	self.id = "CallingCards_loot_Manga"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 480 )
	Image0:setTopBottom( true, false, 0, 122 )
	Image0:setImage( RegisterImage( "uie_t7_loot_callingcard_manga_flying_kick_master_bg1" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 0, 480 )
	Image1:setTopBottom( true, false, 0, 122 )
	Image1:setImage( RegisterImage( "uie_t7_loot_callingcard_manga_flying_kick_master_bg2" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( true, false, 0, 480 )
	Image10:setTopBottom( true, false, 0, 122 )
	Image10:setImage( RegisterImage( "uie_t7_loot_callingcard_manga_flying_kick_master_bg3" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				self.clipFinished( Image0, {} )
				local Image1Frame2 = function ( Image1, event )
					local Image1Frame3 = function ( Image1, event )
						local Image1Frame4 = function ( Image1, event )
							local Image1Frame5 = function ( Image1, event )
								if not event.interrupted then
									Image1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								Image1:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Image1, event )
								else
									Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Image1Frame5( Image1, event )
								return 
							else
								Image1:beginAnimation( "keyframe", 839, false, false, CoD.TweenType.Linear )
								Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame5 )
							end
						end
						
						if event.interrupted then
							Image1Frame4( Image1, event )
							return 
						else
							Image1:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							Image1:setAlpha( 1 )
							Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame4 )
						end
					end
					
					if event.interrupted then
						Image1Frame3( Image1, event )
						return 
					else
						Image1:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
						Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame3 )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				Image1Frame2( Image1, {} )
				local Image10Frame2 = function ( Image10, event )
					local Image10Frame3 = function ( Image10, event )
						local Image10Frame4 = function ( Image10, event )
							local Image10Frame5 = function ( Image10, event )
								if not event.interrupted then
									Image10:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
								end
								Image10:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( Image10, event )
								else
									Image10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								Image10Frame5( Image10, event )
								return 
							else
								Image10:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
								Image10:registerEventHandler( "transition_complete_keyframe", Image10Frame5 )
							end
						end
						
						if event.interrupted then
							Image10Frame4( Image10, event )
							return 
						else
							Image10:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							Image10:setAlpha( 1 )
							Image10:registerEventHandler( "transition_complete_keyframe", Image10Frame4 )
						end
					end
					
					if event.interrupted then
						Image10Frame3( Image10, event )
						return 
					else
						Image10:beginAnimation( "keyframe", 550, false, false, CoD.TweenType.Linear )
						Image10:registerEventHandler( "transition_complete_keyframe", Image10Frame3 )
					end
				end
				
				Image10:completeAnimation()
				self.Image10:setAlpha( 0 )
				Image10Frame2( Image10, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

