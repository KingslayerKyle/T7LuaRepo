-- 1998d457c17f686f26a7ba5939e0b788
-- This hash is used for caching, delete to decompile the file again

CoD.cac_IconTokenStatic = InheritFrom( LUI.UIElement )
CoD.cac_IconTokenStatic.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.cac_IconTokenStatic )
	self.id = "cac_IconTokenStatic"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	
	local imgTokenBox = LUI.UIImage.new()
	imgTokenBox:setLeftRight( true, true, 0, 0 )
	imgTokenBox:setTopBottom( true, true, 0, 0 )
	imgTokenBox:setAlpha( 0 )
	imgTokenBox:setImage( RegisterImage( "uie_t7_menu_cac_icontokenbox" ) )
	imgTokenBox:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( imgTokenBox )
	self.imgTokenBox = imgTokenBox
	
	local imgIconTokenMult = LUI.UIImage.new()
	imgIconTokenMult:setLeftRight( true, true, 0, 0 )
	imgIconTokenMult:setTopBottom( true, true, 0, 0 )
	imgIconTokenMult:setRGB( 0, 0, 0 )
	imgIconTokenMult:setAlpha( 0.43 )
	imgIconTokenMult:setImage( RegisterImage( "uie_t7_menu_cac_icontoken" ) )
	self:addElement( imgIconTokenMult )
	self.imgIconTokenMult = imgIconTokenMult
	
	local imgIconTokenMultCP = LUI.UIImage.new()
	imgIconTokenMultCP:setLeftRight( true, true, 0, 0 )
	imgIconTokenMultCP:setTopBottom( true, true, 0, 0 )
	imgIconTokenMultCP:setRGB( 0, 0, 0 )
	imgIconTokenMultCP:setAlpha( 0 )
	imgIconTokenMultCP:setImage( RegisterImage( "uie_t7_menu_cac_icontoken_cp" ) )
	self:addElement( imgIconTokenMultCP )
	self.imgIconTokenMultCP = imgIconTokenMultCP
	
	local imgIconToken = LUI.UIImage.new()
	imgIconToken:setLeftRight( true, true, 0, 0 )
	imgIconToken:setTopBottom( true, true, 0, 0 )
	imgIconToken:setAlpha( 0.92 )
	imgIconToken:setImage( RegisterImage( "uie_t7_menu_cac_icontoken" ) )
	imgIconToken:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( imgIconToken )
	self.imgIconToken = imgIconToken
	
	local imgIconTokenCP = LUI.UIImage.new()
	imgIconTokenCP:setLeftRight( true, true, 0, 0 )
	imgIconTokenCP:setTopBottom( true, true, 0, 0 )
	imgIconTokenCP:setAlpha( 0 )
	imgIconTokenCP:setImage( RegisterImage( "uie_t7_menu_cac_icontoken_cp" ) )
	self:addElement( imgIconTokenCP )
	self.imgIconTokenCP = imgIconTokenCP
	
	local glow = LUI.UIImage.new()
	glow:setLeftRight( true, true, 0, 12.7 )
	glow:setTopBottom( true, true, -2, 10.7 )
	glow:setRGB( 1, 0.48, 0 )
	glow:setAlpha( RandomAddPercent( -15, 0.26 ) )
	glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glow )
	self.glow = glow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				imgTokenBox:completeAnimation()
				self.imgTokenBox:setAlpha( 0 )
				self.clipFinished( imgTokenBox, {} )

				imgIconTokenMult:completeAnimation()
				self.imgIconTokenMult:setAlpha( 0 )
				self.clipFinished( imgIconTokenMult, {} )

				imgIconTokenMultCP:completeAnimation()
				self.imgIconTokenMultCP:setAlpha( 0 )
				self.clipFinished( imgIconTokenMultCP, {} )

				imgIconToken:completeAnimation()
				self.imgIconToken:setAlpha( 0 )
				self.clipFinished( imgIconToken, {} )

				imgIconTokenCP:completeAnimation()
				self.imgIconTokenCP:setAlpha( 0 )
				self.clipFinished( imgIconTokenCP, {} )

				glow:completeAnimation()
				self.glow:setAlpha( RandomAddPercent( -15, 0 ) )
				self.clipFinished( glow, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				imgTokenBox:completeAnimation()
				self.imgTokenBox:setLeftRight( true, true, -1.89, 3.89 )
				self.imgTokenBox:setTopBottom( true, true, -4, 4 )
				self.imgTokenBox:setAlpha( 0 )
				self.clipFinished( imgTokenBox, {} )

				imgIconTokenMult:completeAnimation()
				self.imgIconTokenMult:setAlpha( 0.43 )
				self.clipFinished( imgIconTokenMult, {} )

				imgIconTokenMultCP:completeAnimation()
				self.imgIconTokenMultCP:setAlpha( 0 )
				self.clipFinished( imgIconTokenMultCP, {} )

				imgIconToken:completeAnimation()
				self.imgIconToken:setAlpha( 0.92 )
				self.clipFinished( imgIconToken, {} )

				imgIconTokenCP:completeAnimation()
				self.imgIconTokenCP:setAlpha( 0 )
				self.clipFinished( imgIconTokenCP, {} )
				local glowFrame2 = function ( glow, event )
					local glowFrame3 = function ( glow, event )
						if not event.interrupted then
							glow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						glow:setAlpha( RandomAddPercent( -15, 0.26 ) )
						if event.interrupted then
							self.clipFinished( glow, event )
						else
							glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glowFrame3( glow, event )
						return 
					else
						glow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						glow:registerEventHandler( "transition_complete_keyframe", glowFrame3 )
					end
				end
				
				glow:completeAnimation()
				self.glow:setAlpha( RandomAddPercent( -15, 0.26 ) )
				glowFrame2( glow, {} )

				self.nextClip = "DefaultClip"
			end
		},
		VisibleCP = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				imgTokenBox:completeAnimation()
				self.imgTokenBox:setAlpha( 1 )
				self.clipFinished( imgTokenBox, {} )

				imgIconTokenMult:completeAnimation()
				self.imgIconTokenMult:setAlpha( 0 )
				self.clipFinished( imgIconTokenMult, {} )

				imgIconTokenMultCP:completeAnimation()
				self.imgIconTokenMultCP:setAlpha( 0.43 )
				self.clipFinished( imgIconTokenMultCP, {} )

				imgIconToken:completeAnimation()
				self.imgIconToken:setAlpha( 0 )
				self.clipFinished( imgIconToken, {} )

				imgIconTokenCP:completeAnimation()
				self.imgIconTokenCP:setAlpha( 0.92 )
				self.clipFinished( imgIconTokenCP, {} )
				local glowFrame2 = function ( glow, event )
					local glowFrame3 = function ( glow, event )
						if not event.interrupted then
							glow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						glow:setAlpha( RandomAddPercent( -15, 0.26 ) )
						if event.interrupted then
							self.clipFinished( glow, event )
						else
							glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glowFrame3( glow, event )
						return 
					else
						glow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						glow:registerEventHandler( "transition_complete_keyframe", glowFrame3 )
					end
				end
				
				glow:completeAnimation()
				self.glow:setAlpha( RandomAddPercent( -15, 0.26 ) )
				glowFrame2( glow, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return not IsCampaign()
			end
		},
		{
			stateName = "VisibleCP",
			condition = function ( menu, element, event )
				return IsCampaign()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

