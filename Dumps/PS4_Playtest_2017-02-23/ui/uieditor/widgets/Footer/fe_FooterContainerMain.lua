require( "ui.uieditor.widgets.Footer.fe_LeftContainerMain" )
require( "ui.uieditor.widgets.Footer.fe_RightContainerMain" )

CoD.fe_FooterContainerMain = InheritFrom( LUI.UIElement )
CoD.fe_FooterContainerMain.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.fe_FooterContainerMain )
	self.id = "fe_FooterContainerMain"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 97 )
	self.anyChildUsesUpdateState = true
	
	local blackleftBG = LUI.UIImage.new()
	blackleftBG:setLeftRight( 0, 1, -185, 197 )
	blackleftBG:setTopBottom( 1, 1, -60, 224 )
	blackleftBG:setRGB( 0, 0, 0 )
	blackleftBG:setAlpha( 0.65 )
	self:addElement( blackleftBG )
	self.blackleftBG = blackleftBG
	
	local LineLeft = LUI.UIImage.new()
	LineLeft:setLeftRight( 0, 1, -185, 197 )
	LineLeft:setTopBottom( 1, 1, -63, -57 )
	LineLeft:setAlpha( 0.55 )
	LineLeft:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframeum" ) )
	LineLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineLeft )
	self.LineLeft = LineLeft
	
	local feRightContainer = CoD.fe_RightContainerMain.new( menu, controller )
	feRightContainer:setLeftRight( 1, 1, -1395, -72 )
	feRightContainer:setTopBottom( 1, 1, -98, -6 )
	feRightContainer:linkToElementModel( self, nil, false, function ( model )
		feRightContainer:setModel( model, controller )
	end )
	self:addElement( feRightContainer )
	self.feRightContainer = feRightContainer
	
	local PressStartText = CoD.fe_LeftContainerMain.new( menu, controller )
	PressStartText:setLeftRight( 0, 0, 71, 764 )
	PressStartText:setTopBottom( 1, 1, -44.5, -17.5 )
	self:addElement( PressStartText )
	self.PressStartText = PressStartText
	
	self.resetProperties = function ()
		PressStartText:completeAnimation()
		LineLeft:completeAnimation()
		blackleftBG:completeAnimation()
		feRightContainer:completeAnimation()
		PressStartText:setAlpha( 1 )
		LineLeft:setAlpha( 0.55 )
		blackleftBG:setAlpha( 0.65 )
		feRightContainer:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local blackleftBGFrame2 = function ( blackleftBG, event )
					local blackleftBGFrame3 = function ( blackleftBG, event )
						if not event.interrupted then
							blackleftBG:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						end
						blackleftBG:setAlpha( 0.65 )
						if event.interrupted then
							self.clipFinished( blackleftBG, event )
						else
							blackleftBG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						blackleftBGFrame3( blackleftBG, event )
						return 
					else
						blackleftBG:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
						blackleftBG:registerEventHandler( "transition_complete_keyframe", blackleftBGFrame3 )
					end
				end
				
				blackleftBG:completeAnimation()
				self.blackleftBG:setAlpha( 0 )
				blackleftBGFrame2( blackleftBG, {} )
				local LineLeftFrame2 = function ( LineLeft, event )
					local LineLeftFrame3 = function ( LineLeft, event )
						if not event.interrupted then
							LineLeft:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						end
						LineLeft:setAlpha( 0.55 )
						if event.interrupted then
							self.clipFinished( LineLeft, event )
						else
							LineLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LineLeftFrame3( LineLeft, event )
						return 
					else
						LineLeft:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
						LineLeft:registerEventHandler( "transition_complete_keyframe", LineLeftFrame3 )
					end
				end
				
				LineLeft:completeAnimation()
				self.LineLeft:setAlpha( 0 )
				LineLeftFrame2( LineLeft, {} )
				local feRightContainerFrame2 = function ( feRightContainer, event )
					local feRightContainerFrame3 = function ( feRightContainer, event )
						if not event.interrupted then
							feRightContainer:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						end
						feRightContainer:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( feRightContainer, event )
						else
							feRightContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						feRightContainerFrame3( feRightContainer, event )
						return 
					else
						feRightContainer:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
						feRightContainer:registerEventHandler( "transition_complete_keyframe", feRightContainerFrame3 )
					end
				end
				
				feRightContainer:completeAnimation()
				self.feRightContainer:setAlpha( 0 )
				feRightContainerFrame2( feRightContainer, {} )
				local PressStartTextFrame2 = function ( PressStartText, event )
					if not event.interrupted then
						PressStartText:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
					end
					PressStartText:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( PressStartText, event )
					else
						PressStartText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PressStartText:completeAnimation()
				self.PressStartText:setAlpha( 0 )
				PressStartTextFrame2( PressStartText, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.feRightContainer:close()
		self.PressStartText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

