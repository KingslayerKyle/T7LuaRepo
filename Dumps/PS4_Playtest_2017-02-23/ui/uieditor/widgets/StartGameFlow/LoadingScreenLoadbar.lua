require( "ui.uieditor.widgets.StartGameFlow.TeamIconAndNameWidgetElemSide" )

CoD.LoadingScreenLoadbar = InheritFrom( LUI.UIElement )
CoD.LoadingScreenLoadbar.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LoadingScreenLoadbar )
	self.id = "LoadingScreenLoadbar"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1803 )
	self:setTopBottom( 0, 0, 0, 44 )
	
	local LoadingElem2 = CoD.TeamIconAndNameWidgetElemSide.new( menu, controller )
	LoadingElem2:setLeftRight( 1, 1, -43, 0 )
	LoadingElem2:setTopBottom( 1, 1, -41, -1 )
	LoadingElem2:setYRot( -180 )
	self:addElement( LoadingElem2 )
	self.LoadingElem2 = LoadingElem2
	
	local LoadingElem1 = CoD.TeamIconAndNameWidgetElemSide.new( menu, controller )
	LoadingElem1:setLeftRight( 0, 0, 0, 44 )
	LoadingElem1:setTopBottom( 1, 1, -42, -2 )
	self:addElement( LoadingElem1 )
	self.LoadingElem1 = LoadingElem1
	
	local LoadingBar = LUI.UIImage.new()
	LoadingBar:setLeftRight( 0, 1, 95, -95 )
	LoadingBar:setTopBottom( 1, 1, -16, -4 )
	LoadingBar:setRGB( 1, 0.35, 0 )
	LoadingBar:setImage( RegisterImage( "uie_t7_mp_menu_startflow_meterfill" ) )
	LoadingBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	LoadingBar:setShaderVector( 1, 0, 0, 0, 0 )
	LoadingBar:setShaderVector( 2, 1, 0, 0, 0 )
	LoadingBar:setShaderVector( 3, 0, 0, 0, 0 )
	LoadingBar:setShaderVector( 4, 0, 0, 0, 0 )
	LoadingBar:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "loadedFraction", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LoadingBar:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( LoadingBar )
	self.LoadingBar = LoadingBar
	
	local LoadingLine3 = LUI.UIImage.new()
	LoadingLine3:setLeftRight( 0, 1, 97, -97 )
	LoadingLine3:setTopBottom( 1, 1, -10, 2 )
	LoadingLine3:setRGB( 0.9, 0.9, 0.9 )
	LoadingLine3:setAlpha( 0.9 )
	LoadingLine3:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	LoadingLine3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LoadingLine3 )
	self.LoadingLine3 = LoadingLine3
	
	local LoadingLine2 = LUI.UIImage.new()
	LoadingLine2:setLeftRight( 0, 1, 97, -97 )
	LoadingLine2:setTopBottom( 1, 1, -22, -10 )
	LoadingLine2:setRGB( 0.9, 0.9, 0.9 )
	LoadingLine2:setAlpha( 0.9 )
	LoadingLine2:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	LoadingLine2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LoadingLine2 )
	self.LoadingLine2 = LoadingLine2
	
	self.resetProperties = function ()
		LoadingBar:completeAnimation()
		LoadingElem1:completeAnimation()
		LoadingElem2:completeAnimation()
		LoadingLine3:completeAnimation()
		LoadingLine2:completeAnimation()
		LoadingBar:setAlpha( 1 )
		LoadingElem1:setAlpha( 1 )
		LoadingElem2:setAlpha( 1 )
		LoadingLine3:setAlpha( 0.9 )
		LoadingLine2:setAlpha( 0.9 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			StartLoading = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local LoadingElem2Frame2 = function ( LoadingElem2, event )
					local LoadingElem2Frame3 = function ( LoadingElem2, event )
						if not event.interrupted then
							LoadingElem2:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						end
						LoadingElem2:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LoadingElem2, event )
						else
							LoadingElem2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LoadingElem2Frame3( LoadingElem2, event )
						return 
					else
						LoadingElem2:beginAnimation( "keyframe", 2240, false, false, CoD.TweenType.Linear )
						LoadingElem2:registerEventHandler( "transition_complete_keyframe", LoadingElem2Frame3 )
					end
				end
				
				LoadingElem2:completeAnimation()
				self.LoadingElem2:setAlpha( 0 )
				LoadingElem2Frame2( LoadingElem2, {} )
				local LoadingElem1Frame2 = function ( LoadingElem1, event )
					local LoadingElem1Frame3 = function ( LoadingElem1, event )
						if not event.interrupted then
							LoadingElem1:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						end
						LoadingElem1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LoadingElem1, event )
						else
							LoadingElem1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LoadingElem1Frame3( LoadingElem1, event )
						return 
					else
						LoadingElem1:beginAnimation( "keyframe", 2240, false, false, CoD.TweenType.Linear )
						LoadingElem1:registerEventHandler( "transition_complete_keyframe", LoadingElem1Frame3 )
					end
				end
				
				LoadingElem1:completeAnimation()
				self.LoadingElem1:setAlpha( 0 )
				LoadingElem1Frame2( LoadingElem1, {} )
				local LoadingBarFrame2 = function ( LoadingBar, event )
					local LoadingBarFrame3 = function ( LoadingBar, event )
						if not event.interrupted then
							LoadingBar:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						end
						LoadingBar:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LoadingBar, event )
						else
							LoadingBar:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LoadingBarFrame3( LoadingBar, event )
						return 
					else
						LoadingBar:beginAnimation( "keyframe", 2240, false, false, CoD.TweenType.Linear )
						LoadingBar:registerEventHandler( "transition_complete_keyframe", LoadingBarFrame3 )
					end
				end
				
				LoadingBar:completeAnimation()
				self.LoadingBar:setAlpha( 0 )
				LoadingBarFrame2( LoadingBar, {} )
				local LoadingLine3Frame2 = function ( LoadingLine3, event )
					local LoadingLine3Frame3 = function ( LoadingLine3, event )
						if not event.interrupted then
							LoadingLine3:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						end
						LoadingLine3:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LoadingLine3, event )
						else
							LoadingLine3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LoadingLine3Frame3( LoadingLine3, event )
						return 
					else
						LoadingLine3:beginAnimation( "keyframe", 2240, false, false, CoD.TweenType.Linear )
						LoadingLine3:registerEventHandler( "transition_complete_keyframe", LoadingLine3Frame3 )
					end
				end
				
				LoadingLine3:completeAnimation()
				self.LoadingLine3:setAlpha( 0 )
				LoadingLine3Frame2( LoadingLine3, {} )
				local LoadingLine2Frame2 = function ( LoadingLine2, event )
					local LoadingLine2Frame3 = function ( LoadingLine2, event )
						if not event.interrupted then
							LoadingLine2:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						end
						LoadingLine2:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LoadingLine2, event )
						else
							LoadingLine2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LoadingLine2Frame3( LoadingLine2, event )
						return 
					else
						LoadingLine2:beginAnimation( "keyframe", 2240, false, false, CoD.TweenType.Linear )
						LoadingLine2:registerEventHandler( "transition_complete_keyframe", LoadingLine2Frame3 )
					end
				end
				
				LoadingLine2:completeAnimation()
				self.LoadingLine2:setAlpha( 0 )
				LoadingLine2Frame2( LoadingLine2, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LoadingElem2:close()
		self.LoadingElem1:close()
		self.LoadingBar:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

