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
	self:setLeftRight( 0, 0, 0, 48 )
	self:setTopBottom( 0, 0, 0, 48 )
	
	local imgTokenBox = LUI.UIImage.new()
	imgTokenBox:setLeftRight( 0, 1, 0, 0 )
	imgTokenBox:setTopBottom( 0, 1, 0, 0 )
	imgTokenBox:setAlpha( 0 )
	imgTokenBox:setImage( RegisterImage( "uie_t7_menu_cac_icontokenbox" ) )
	imgTokenBox:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( imgTokenBox )
	self.imgTokenBox = imgTokenBox
	
	local imgIconTokenMult = LUI.UIImage.new()
	imgIconTokenMult:setLeftRight( 0, 1, 0, 0 )
	imgIconTokenMult:setTopBottom( 0, 1, 0, 0 )
	imgIconTokenMult:setRGB( 0, 0, 0 )
	imgIconTokenMult:setAlpha( 0.43 )
	self:addElement( imgIconTokenMult )
	self.imgIconTokenMult = imgIconTokenMult
	
	local imgIconTokenMultCP = LUI.UIImage.new()
	imgIconTokenMultCP:setLeftRight( 0, 1, 0, 0 )
	imgIconTokenMultCP:setTopBottom( 0, 1, 0, 0 )
	imgIconTokenMultCP:setRGB( 0, 0, 0 )
	imgIconTokenMultCP:setAlpha( 0 )
	imgIconTokenMultCP:setImage( RegisterImage( "uie_t7_menu_cac_icontoken_cp" ) )
	self:addElement( imgIconTokenMultCP )
	self.imgIconTokenMultCP = imgIconTokenMultCP
	
	local imgIconToken = LUI.UIImage.new()
	imgIconToken:setLeftRight( 0, 1, 0, 0 )
	imgIconToken:setTopBottom( 0, 1, 0, 0 )
	imgIconToken:setAlpha( 0.92 )
	imgIconToken:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( imgIconToken )
	self.imgIconToken = imgIconToken
	
	local imgIconTokenCP = LUI.UIImage.new()
	imgIconTokenCP:setLeftRight( 0, 1, 0, 0 )
	imgIconTokenCP:setTopBottom( 0, 1, 0, 0 )
	imgIconTokenCP:setAlpha( 0 )
	imgIconTokenCP:setImage( RegisterImage( "uie_t7_menu_cac_icontoken_cp" ) )
	self:addElement( imgIconTokenCP )
	self.imgIconTokenCP = imgIconTokenCP
	
	local glow = LUI.UIImage.new()
	glow:setLeftRight( 0, 1, 0, 20 )
	glow:setTopBottom( 0, 1, -3, 17 )
	glow:setRGB( 1, 0.48, 0 )
	glow:setAlpha( RandomAddPercent( -15, 0.26 ) )
	glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glow )
	self.glow = glow
	
	self.resetProperties = function ()
		glow:completeAnimation()
		imgIconToken:completeAnimation()
		imgIconTokenMult:completeAnimation()
		imgTokenBox:completeAnimation()
		imgIconTokenCP:completeAnimation()
		imgIconTokenMultCP:completeAnimation()
		glow:setAlpha( RandomAddPercent( -15, 0.26 ) )
		imgIconToken:setAlpha( 0.92 )
		imgIconTokenMult:setAlpha( 0.43 )
		imgTokenBox:setLeftRight( 0, 1, 0, 0 )
		imgTokenBox:setTopBottom( 0, 1, 0, 0 )
		imgTokenBox:setAlpha( 0 )
		imgIconTokenCP:setAlpha( 0 )
		imgIconTokenMultCP:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				imgIconTokenMult:completeAnimation()
				self.imgIconTokenMult:setAlpha( 0 )
				self.clipFinished( imgIconTokenMult, {} )
				imgIconToken:completeAnimation()
				self.imgIconToken:setAlpha( 0 )
				self.clipFinished( imgIconToken, {} )
				glow:completeAnimation()
				self.glow:setAlpha( RandomAddPercent( -15, 0 ) )
				self.clipFinished( glow, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				imgTokenBox:completeAnimation()
				self.imgTokenBox:setLeftRight( 0, 1, -2, 6 )
				self.imgTokenBox:setTopBottom( 0, 1, -6, 6 )
				self.clipFinished( imgTokenBox, {} )
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
				self.resetProperties()
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

