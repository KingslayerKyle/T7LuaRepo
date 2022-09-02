-- c6450fa27a4463771cd458f06d08b606
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BlackMarket.LootDecryptionImageRarityColor" )
require( "ui.uieditor.widgets.BlackMarket.LootDecryptionImage" )

CoD.LootDecryptionFakeImageCycle = InheritFrom( LUI.UIElement )
CoD.LootDecryptionFakeImageCycle.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.LootDecryptionFakeImageCycle )
	self.id = "LootDecryptionFakeImageCycle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 255 )
	self:setTopBottom( true, false, 0, 348 )
	self.anyChildUsesUpdateState = true
	
	local RarityColor5 = CoD.LootDecryptionImageRarityColor.new( menu, controller )
	RarityColor5:setLeftRight( true, true, -29, 29 )
	RarityColor5:setTopBottom( true, true, -23.25, 27.25 )
	RarityColor5:setAlpha( 0.08 )
	RarityColor5:linkToElementModel( self, "fakeloot5", false, function ( model )
		RarityColor5:setModel( model, controller )
	end )
	self:addElement( RarityColor5 )
	self.RarityColor5 = RarityColor5
	
	local RarityColor1 = CoD.LootDecryptionImageRarityColor.new( menu, controller )
	RarityColor1:setLeftRight( true, true, -29, 29 )
	RarityColor1:setTopBottom( true, true, -23.25, 27.25 )
	RarityColor1:linkToElementModel( self, "fakeloot1", false, function ( model )
		RarityColor1:setModel( model, controller )
	end )
	self:addElement( RarityColor1 )
	self.RarityColor1 = RarityColor1
	
	local RarityColor2 = CoD.LootDecryptionImageRarityColor.new( menu, controller )
	RarityColor2:setLeftRight( true, true, -29, 29 )
	RarityColor2:setTopBottom( true, true, -23.25, 27.25 )
	RarityColor2:setAlpha( 0.08 )
	RarityColor2:linkToElementModel( self, "fakeloot2", false, function ( model )
		RarityColor2:setModel( model, controller )
	end )
	self:addElement( RarityColor2 )
	self.RarityColor2 = RarityColor2
	
	local RarityColor3 = CoD.LootDecryptionImageRarityColor.new( menu, controller )
	RarityColor3:setLeftRight( true, true, -29, 29 )
	RarityColor3:setTopBottom( true, true, -23.25, 27.25 )
	RarityColor3:setAlpha( 0.08 )
	RarityColor3:linkToElementModel( self, "fakeloot3", false, function ( model )
		RarityColor3:setModel( model, controller )
	end )
	self:addElement( RarityColor3 )
	self.RarityColor3 = RarityColor3
	
	local RarityColor4 = CoD.LootDecryptionImageRarityColor.new( menu, controller )
	RarityColor4:setLeftRight( true, true, -29, 29 )
	RarityColor4:setTopBottom( true, true, -23.25, 27.25 )
	RarityColor4:linkToElementModel( self, "fakeloot4", false, function ( model )
		RarityColor4:setModel( model, controller )
	end )
	self:addElement( RarityColor4 )
	self.RarityColor4 = RarityColor4
	
	local FakeImage5 = CoD.LootDecryptionImage.new( menu, controller )
	FakeImage5:setLeftRight( false, false, -112.5, 112.5 )
	FakeImage5:setTopBottom( false, false, -76, 80 )
	FakeImage5:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration" ) )
	FakeImage5:setShaderVector( 0, 0, 1, 0, 0 )
	FakeImage5:setShaderVector( 1, 0, 0, 0, 0 )
	FakeImage5:setShaderVector( 2, 0, 0, 0, 0 )
	FakeImage5:setShaderVector( 3, 0, 0, 0, 0 )
	FakeImage5:setShaderVector( 4, 0, 0, 0, 0 )
	FakeImage5:linkToElementModel( self, "fakeloot5", false, function ( model )
		FakeImage5:setModel( model, controller )
	end )
	self:addElement( FakeImage5 )
	self.FakeImage5 = FakeImage5
	
	local FakeImage1 = CoD.LootDecryptionImage.new( menu, controller )
	FakeImage1:setLeftRight( false, false, -112.5, 112.5 )
	FakeImage1:setTopBottom( false, false, -76, 80 )
	FakeImage1:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration" ) )
	FakeImage1:setShaderVector( 0, 0, 1, 0, 0 )
	FakeImage1:setShaderVector( 1, 0, 0, 0, 0 )
	FakeImage1:setShaderVector( 2, 0, 0, 0, 0 )
	FakeImage1:setShaderVector( 3, 0, 0, 0, 0 )
	FakeImage1:setShaderVector( 4, 0, 0, 0, 0 )
	FakeImage1:linkToElementModel( self, "fakeloot1", false, function ( model )
		FakeImage1:setModel( model, controller )
	end )
	self:addElement( FakeImage1 )
	self.FakeImage1 = FakeImage1
	
	local FakeImage2 = CoD.LootDecryptionImage.new( menu, controller )
	FakeImage2:setLeftRight( false, false, -112.5, 112.5 )
	FakeImage2:setTopBottom( false, false, -76, 80 )
	FakeImage2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration" ) )
	FakeImage2:setShaderVector( 0, 0, 1, 0, 0 )
	FakeImage2:setShaderVector( 1, 0, 0, 0, 0 )
	FakeImage2:setShaderVector( 2, 0, 0, 0, 0 )
	FakeImage2:setShaderVector( 3, 0, 0, 0, 0 )
	FakeImage2:setShaderVector( 4, 0, 0, 0, 0 )
	FakeImage2:linkToElementModel( self, "fakeloot2", false, function ( model )
		FakeImage2:setModel( model, controller )
	end )
	self:addElement( FakeImage2 )
	self.FakeImage2 = FakeImage2
	
	local FakeImage3 = CoD.LootDecryptionImage.new( menu, controller )
	FakeImage3:setLeftRight( false, false, -112.5, 112.5 )
	FakeImage3:setTopBottom( false, false, -76, 80 )
	FakeImage3:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration" ) )
	FakeImage3:setShaderVector( 0, 0, 1, 0, 0 )
	FakeImage3:setShaderVector( 1, 0, 0, 0, 0 )
	FakeImage3:setShaderVector( 2, 0, 0, 0, 0 )
	FakeImage3:setShaderVector( 3, 0, 0, 0, 0 )
	FakeImage3:setShaderVector( 4, 0, 0, 0, 0 )
	FakeImage3:linkToElementModel( self, "fakeloot3", false, function ( model )
		FakeImage3:setModel( model, controller )
	end )
	self:addElement( FakeImage3 )
	self.FakeImage3 = FakeImage3
	
	local FakeImage4 = CoD.LootDecryptionImage.new( menu, controller )
	FakeImage4:setLeftRight( false, false, -112.5, 112.5 )
	FakeImage4:setTopBottom( false, false, -76, 80 )
	FakeImage4:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration" ) )
	FakeImage4:setShaderVector( 0, 0, 1, 0, 0 )
	FakeImage4:setShaderVector( 1, 0, 0, 0, 0 )
	FakeImage4:setShaderVector( 2, 0, 0, 0, 0 )
	FakeImage4:setShaderVector( 3, 0, 0, 0, 0 )
	FakeImage4:setShaderVector( 4, 0, 0, 0, 0 )
	FakeImage4:linkToElementModel( self, "fakeloot4", false, function ( model )
		FakeImage4:setModel( model, controller )
	end )
	self:addElement( FakeImage4 )
	self.FakeImage4 = FakeImage4
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

				local RarityColor5Frame2 = function ( RarityColor5, event )
					local RarityColor5Frame3 = function ( RarityColor5, event )
						local RarityColor5Frame4 = function ( RarityColor5, event )
							if not event.interrupted then
								RarityColor5:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							end
							RarityColor5:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( RarityColor5, event )
							else
								RarityColor5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RarityColor5Frame4( RarityColor5, event )
							return 
						else
							RarityColor5:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							RarityColor5:setAlpha( 1 )
							RarityColor5:registerEventHandler( "transition_complete_keyframe", RarityColor5Frame4 )
						end
					end
					
					if event.interrupted then
						RarityColor5Frame3( RarityColor5, event )
						return 
					else
						RarityColor5:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
						RarityColor5:registerEventHandler( "transition_complete_keyframe", RarityColor5Frame3 )
					end
				end
				
				RarityColor5:completeAnimation()
				self.RarityColor5:setAlpha( 0 )
				RarityColor5Frame2( RarityColor5, {} )
				local RarityColor1Frame2 = function ( RarityColor1, event )
					local RarityColor1Frame3 = function ( RarityColor1, event )
						local RarityColor1Frame4 = function ( RarityColor1, event )
							if not event.interrupted then
								RarityColor1:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							end
							RarityColor1:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( RarityColor1, event )
							else
								RarityColor1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RarityColor1Frame4( RarityColor1, event )
							return 
						else
							RarityColor1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							RarityColor1:setAlpha( 1 )
							RarityColor1:registerEventHandler( "transition_complete_keyframe", RarityColor1Frame4 )
						end
					end
					
					if event.interrupted then
						RarityColor1Frame3( RarityColor1, event )
						return 
					else
						RarityColor1:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						RarityColor1:registerEventHandler( "transition_complete_keyframe", RarityColor1Frame3 )
					end
				end
				
				RarityColor1:completeAnimation()
				self.RarityColor1:setAlpha( 0 )
				RarityColor1Frame2( RarityColor1, {} )
				local RarityColor2Frame2 = function ( RarityColor2, event )
					local RarityColor2Frame3 = function ( RarityColor2, event )
						local RarityColor2Frame4 = function ( RarityColor2, event )
							if not event.interrupted then
								RarityColor2:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
							end
							RarityColor2:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( RarityColor2, event )
							else
								RarityColor2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RarityColor2Frame4( RarityColor2, event )
							return 
						else
							RarityColor2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							RarityColor2:setAlpha( 1 )
							RarityColor2:registerEventHandler( "transition_complete_keyframe", RarityColor2Frame4 )
						end
					end
					
					if event.interrupted then
						RarityColor2Frame3( RarityColor2, event )
						return 
					else
						RarityColor2:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						RarityColor2:registerEventHandler( "transition_complete_keyframe", RarityColor2Frame3 )
					end
				end
				
				RarityColor2:completeAnimation()
				self.RarityColor2:setAlpha( 0 )
				RarityColor2Frame2( RarityColor2, {} )
				local RarityColor3Frame2 = function ( RarityColor3, event )
					local RarityColor3Frame3 = function ( RarityColor3, event )
						local RarityColor3Frame4 = function ( RarityColor3, event )
							if not event.interrupted then
								RarityColor3:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
							end
							RarityColor3:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( RarityColor3, event )
							else
								RarityColor3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							RarityColor3Frame4( RarityColor3, event )
							return 
						else
							RarityColor3:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							RarityColor3:setAlpha( 1 )
							RarityColor3:registerEventHandler( "transition_complete_keyframe", RarityColor3Frame4 )
						end
					end
					
					if event.interrupted then
						RarityColor3Frame3( RarityColor3, event )
						return 
					else
						RarityColor3:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						RarityColor3:registerEventHandler( "transition_complete_keyframe", RarityColor3Frame3 )
					end
				end
				
				RarityColor3:completeAnimation()
				self.RarityColor3:setAlpha( 0 )
				RarityColor3Frame2( RarityColor3, {} )
				local RarityColor4Frame2 = function ( RarityColor4, event )
					if not event.interrupted then
						RarityColor4:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					RarityColor4:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( RarityColor4, event )
					else
						RarityColor4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RarityColor4:completeAnimation()
				self.RarityColor4:setAlpha( 1 )
				RarityColor4Frame2( RarityColor4, {} )
				local FakeImage5Frame2 = function ( FakeImage5, event )
					local FakeImage5Frame3 = function ( FakeImage5, event )
						local FakeImage5Frame4 = function ( FakeImage5, event )
							if not event.interrupted then
								FakeImage5:beginAnimation( "keyframe", 149, true, false, CoD.TweenType.Linear )
							end
							FakeImage5:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( FakeImage5, event )
							else
								FakeImage5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FakeImage5Frame4( FakeImage5, event )
							return 
						else
							FakeImage5:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							FakeImage5:setAlpha( 1 )
							FakeImage5:registerEventHandler( "transition_complete_keyframe", FakeImage5Frame4 )
						end
					end
					
					if event.interrupted then
						FakeImage5Frame3( FakeImage5, event )
						return 
					else
						FakeImage5:beginAnimation( "keyframe", 589, false, false, CoD.TweenType.Linear )
						FakeImage5:registerEventHandler( "transition_complete_keyframe", FakeImage5Frame3 )
					end
				end
				
				FakeImage5:completeAnimation()
				self.FakeImage5:setAlpha( 0 )
				FakeImage5Frame2( FakeImage5, {} )
				local FakeImage1Frame2 = function ( FakeImage1, event )
					local FakeImage1Frame3 = function ( FakeImage1, event )
						local FakeImage1Frame4 = function ( FakeImage1, event )
							if not event.interrupted then
								FakeImage1:beginAnimation( "keyframe", 150, true, false, CoD.TweenType.Linear )
							end
							FakeImage1:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( FakeImage1, event )
							else
								FakeImage1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FakeImage1Frame4( FakeImage1, event )
							return 
						else
							FakeImage1:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FakeImage1:setAlpha( 1 )
							FakeImage1:registerEventHandler( "transition_complete_keyframe", FakeImage1Frame4 )
						end
					end
					
					if event.interrupted then
						FakeImage1Frame3( FakeImage1, event )
						return 
					else
						FakeImage1:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						FakeImage1:registerEventHandler( "transition_complete_keyframe", FakeImage1Frame3 )
					end
				end
				
				FakeImage1:completeAnimation()
				self.FakeImage1:setAlpha( 0 )
				FakeImage1Frame2( FakeImage1, {} )
				local FakeImage2Frame2 = function ( FakeImage2, event )
					local FakeImage2Frame3 = function ( FakeImage2, event )
						local FakeImage2Frame4 = function ( FakeImage2, event )
							if not event.interrupted then
								FakeImage2:beginAnimation( "keyframe", 149, true, false, CoD.TweenType.Linear )
							end
							FakeImage2:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( FakeImage2, event )
							else
								FakeImage2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FakeImage2Frame4( FakeImage2, event )
							return 
						else
							FakeImage2:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							FakeImage2:setAlpha( 0.75 )
							FakeImage2:registerEventHandler( "transition_complete_keyframe", FakeImage2Frame4 )
						end
					end
					
					if event.interrupted then
						FakeImage2Frame3( FakeImage2, event )
						return 
					else
						FakeImage2:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
						FakeImage2:registerEventHandler( "transition_complete_keyframe", FakeImage2Frame3 )
					end
				end
				
				FakeImage2:completeAnimation()
				self.FakeImage2:setAlpha( 0 )
				FakeImage2Frame2( FakeImage2, {} )
				local FakeImage3Frame2 = function ( FakeImage3, event )
					local FakeImage3Frame3 = function ( FakeImage3, event )
						local FakeImage3Frame4 = function ( FakeImage3, event )
							if not event.interrupted then
								FakeImage3:beginAnimation( "keyframe", 150, true, false, CoD.TweenType.Linear )
							end
							FakeImage3:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( FakeImage3, event )
							else
								FakeImage3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FakeImage3Frame4( FakeImage3, event )
							return 
						else
							FakeImage3:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							FakeImage3:setAlpha( 1 )
							FakeImage3:registerEventHandler( "transition_complete_keyframe", FakeImage3Frame4 )
						end
					end
					
					if event.interrupted then
						FakeImage3Frame3( FakeImage3, event )
						return 
					else
						FakeImage3:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						FakeImage3:registerEventHandler( "transition_complete_keyframe", FakeImage3Frame3 )
					end
				end
				
				FakeImage3:completeAnimation()
				self.FakeImage3:setAlpha( 0 )
				FakeImage3Frame2( FakeImage3, {} )
				local FakeImage4Frame2 = function ( FakeImage4, event )
					if not event.interrupted then
						FakeImage4:beginAnimation( "keyframe", 150, true, false, CoD.TweenType.Linear )
					end
					FakeImage4:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FakeImage4, event )
					else
						FakeImage4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FakeImage4:completeAnimation()
				self.FakeImage4:setAlpha( 1 )
				FakeImage4Frame2( FakeImage4, {} )

				self.nextClip = "DefaultClip"
			end,
			Looping = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.RarityColor5:close()
		element.RarityColor1:close()
		element.RarityColor2:close()
		element.RarityColor3:close()
		element.RarityColor4:close()
		element.FakeImage5:close()
		element.FakeImage1:close()
		element.FakeImage2:close()
		element.FakeImage3:close()
		element.FakeImage4:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

