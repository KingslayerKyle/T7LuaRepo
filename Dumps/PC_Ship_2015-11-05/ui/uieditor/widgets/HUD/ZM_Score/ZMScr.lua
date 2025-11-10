require( "ui.uieditor.widgets.HUD.ZM_Score.ZMScr_ListingLg" )
require( "ui.uieditor.widgets.HUD.ZM_Score.ZMScr_ListingSm" )
require( "ui.uieditor.widgets.HUD.ZM_Score.ZMScr_PlusPointsContainer" )

DataSources.ZMPlayerList = {
	getModel = function ( f1_arg0 )
		return Engine.CreateModel( Engine.GetModelForController( f1_arg0 ), "PlayerList" )
	end
}
local f0_local0 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4 )
	if f2_arg1 == 0 or f2_arg1 < -10000 or f2_arg1 > 10000 then
		return 
	end
	local f2_local0 = CoD.ZMScr_PlusPointsContainer.new( f2_arg3, f2_arg2 )
	if 0 < f2_arg1 then
		f2_local0.ZMScrPlusPoints.Label1:setText( "+" .. f2_arg1 )
		f2_local0.ZMScrPlusPoints.Label2:setText( "+" .. f2_arg1 )
		f2_local0.ZMScrPlusPoints:playClip( "DefaultClip" )
	else
		f2_local0.ZMScrPlusPoints.Label1:setText( f2_arg1 )
		f2_local0.ZMScrPlusPoints.Label2:setText( f2_arg1 )
		f2_local0.ZMScrPlusPoints:playClip( "NegativeScore" )
	end
	f2_local0:setLeftRight( f2_arg0:getLocalLeftRight() )
	f2_local0:setTopBottom( f2_arg0:getLocalTopBottom() )
	if f2_arg4 then
		f2_local0:setScale( 0.75 )
	end
	f2_arg0.lastAnim = f2_arg0.lastAnim + 1
	f2_local0:setState( "DefaultState" )
	if not f2_local0:hasClip( "Anim" .. f2_arg0.lastAnim ) then
		f2_arg0.lastAnim = 1
	end
	f2_local0:registerEventHandler( "clip_over", function ( element, event )
		element:close()
	end )
	local f2_local1 = f2_arg0:getParent()
	f2_local1:addElement( f2_local0 )
	f2_local0:playClip( "Anim" .. f2_arg0.lastAnim )
end

local PostLoadFunc = function ( self, controller, menu )
	local f4_local0 = 4
	local f4_local1 = {
		damage = 10,
		death_normal = 50,
		death_torso = 60,
		death_neck = 70,
		death_head = 100,
		death_melee = 130
	}
	local f4_local2 = Engine.GetModelForController( controller )
	for f4_local3 = 0, f4_local0 - 1, 1 do
		local f4_local6 = f4_local3
		local f4_local7 = self["ZMScrPlusPoints" .. f4_local6]
		f4_local7:setAlpha( 0 )
		f4_local7.lastAnim = 0
		local f4_local8 = Engine.GetModel( f4_local2, "PlayerList." .. f4_local6 .. ".clientNum" )
		if f4_local8 then
			f4_local8 = Engine.GetModelValue( f4_local8 )
		end
		if f4_local8 ~= nil then
			local f4_local9 = Engine.GetModel( f4_local2, "PlayerList.client" .. f4_local8 )
			if f4_local9 ~= nil then
				for f4_local13, f4_local14 in pairs( f4_local1 ) do
					f4_local7:registerEventHandler( "delayed_score", function ( element, event )
						f0_local0( element, event.score, controller, menu, f4_local6 > 0 )
					end )
					f4_local7:subscribeToModel( Engine.CreateModel( f4_local9, "score_cf_" .. f4_local13 ), function ( model )
						if Engine.GetModelValue( model ) ~= nil then
							local f6_local0 = f4_local14
							local f6_local1 = Engine.GetModel( f4_local2, "hudItems.doublePointsActive" )
							if f6_local1 ~= nil and Engine.GetModelValue( f6_local1 ) == 1 then
								f6_local0 = f4_local14 * 2
							end
							if f4_local7.accountedForScore ~= nil then
								f4_local7.accountedForScore = f4_local7.accountedForScore + f6_local0
							end
							self:addElement( LUI.UITimer.new( 16 * Engine.GetModelValue( model ) % 3, {
								name = "delayed_score",
								score = f6_local0
							}, true, f4_local7 ) )
						end
					end )
				end
			end
		end
		local f4_local9 = Engine.GetModel( f4_local2, "PlayerList." .. f4_local6 .. ".playerScore" )
		f4_local7.accountedForScore = Engine.GetModelValue( f4_local9 )
		f4_local7:subscribeToModel( f4_local9, function ( model )
			local modelValue = Engine.GetModelValue( model )
			if f4_local7.accountedForScore == nil then
				f4_local7.accountedForScore = modelValue
			end
			if modelValue ~= f4_local7.accountedForScore then
				f0_local0( f4_local7, modelValue - f4_local7.accountedForScore, controller, menu, f4_local6 > 0 )
				f4_local7.accountedForScore = modelValue
			end
		end )
	end
	Engine.CreateModel( f4_local2, "hudItems.doublePointsActive" )
end

CoD.ZMScr = InheritFrom( LUI.UIElement )
CoD.ZMScr.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZMScr )
	self.id = "ZMScr"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 134 )
	self:setTopBottom( true, false, 0, 128 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local ListingUser = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	ListingUser:makeFocusable()
	ListingUser:setLeftRight( true, false, 0, 134 )
	ListingUser:setTopBottom( true, false, 70, 128 )
	ListingUser:setDataSource( "PlayerListZM" )
	ListingUser:setWidgetType( CoD.ZMScr_ListingLg )
	ListingUser:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "playerScoreShown", 1 ) and AlwaysTrue()
			end
		}
	} )
	ListingUser:linkToElementModel( ListingUser, "playerScoreShown", true, function ( model )
		menu:updateElementState( ListingUser, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerScoreShown"
		} )
	end )
	self:addElement( ListingUser )
	self.ListingUser = ListingUser
	
	local Listing2 = CoD.ZMScr_ListingSm.new( menu, controller )
	Listing2:setLeftRight( true, false, 16.28, 101.28 )
	Listing2:setTopBottom( true, false, 52.12, 87.12 )
	Listing2:subscribeToGlobalModel( controller, "ZMPlayerList", "1", function ( model )
		Listing2:setModel( model, controller )
	end )
	self:addElement( Listing2 )
	self.Listing2 = Listing2
	
	local Listing3 = CoD.ZMScr_ListingSm.new( menu, controller )
	Listing3:setLeftRight( true, false, 16.28, 101.28 )
	Listing3:setTopBottom( true, false, 26.12, 61.12 )
	Listing3:subscribeToGlobalModel( controller, "ZMPlayerList", "2", function ( model )
		Listing3:setModel( model, controller )
	end )
	self:addElement( Listing3 )
	self.Listing3 = Listing3
	
	local Listing4 = CoD.ZMScr_ListingSm.new( menu, controller )
	Listing4:setLeftRight( true, false, 16.28, 101.28 )
	Listing4:setTopBottom( true, false, 0, 35 )
	Listing4:subscribeToGlobalModel( controller, "ZMPlayerList", "3", function ( model )
		Listing4:setModel( model, controller )
	end )
	self:addElement( Listing4 )
	self.Listing4 = Listing4
	
	local ZMScrPlusPoints0 = CoD.ZMScr_PlusPointsContainer.new( menu, controller )
	ZMScrPlusPoints0:setLeftRight( true, false, 87, 172 )
	ZMScrPlusPoints0:setTopBottom( true, false, 62.25, 128 )
	self:addElement( ZMScrPlusPoints0 )
	self.ZMScrPlusPoints0 = ZMScrPlusPoints0
	
	local ZMScrPlusPoints1 = CoD.ZMScr_PlusPointsContainer.new( menu, controller )
	ZMScrPlusPoints1:setLeftRight( true, false, 87, 172 )
	ZMScrPlusPoints1:setTopBottom( true, false, 33.25, 99 )
	ZMScrPlusPoints1:setScale( 0.75 )
	self:addElement( ZMScrPlusPoints1 )
	self.ZMScrPlusPoints1 = ZMScrPlusPoints1
	
	local ZMScrPlusPoints2 = CoD.ZMScr_PlusPointsContainer.new( menu, controller )
	ZMScrPlusPoints2:setLeftRight( true, false, 87, 172 )
	ZMScrPlusPoints2:setTopBottom( true, false, 7.75, 73.5 )
	ZMScrPlusPoints2:setScale( 0.75 )
	self:addElement( ZMScrPlusPoints2 )
	self.ZMScrPlusPoints2 = ZMScrPlusPoints2
	
	local ZMScrPlusPoints3 = CoD.ZMScr_PlusPointsContainer.new( menu, controller )
	ZMScrPlusPoints3:setLeftRight( true, false, 87, 172 )
	ZMScrPlusPoints3:setTopBottom( true, false, -18.38, 47.38 )
	ZMScrPlusPoints3:setScale( 0.75 )
	self:addElement( ZMScrPlusPoints3 )
	self.ZMScrPlusPoints3 = ZMScrPlusPoints3
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				ListingUser:completeAnimation()
				self.ListingUser:setAlpha( 0 )
				self.clipFinished( ListingUser, {} )
				Listing2:completeAnimation()
				self.Listing2:setAlpha( 0 )
				self.clipFinished( Listing2, {} )
				Listing3:completeAnimation()
				self.Listing3:setAlpha( 0 )
				self.clipFinished( Listing3, {} )
				Listing4:completeAnimation()
				self.Listing4:setAlpha( 0 )
				self.clipFinished( Listing4, {} )
			end,
			HudStart = function ()
				self:setupElementClipCounter( 4 )
				local ListingUserFrame2 = function ( ListingUser, event )
					if not event.interrupted then
						ListingUser:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					ListingUser:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ListingUser, event )
					else
						ListingUser:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ListingUser:completeAnimation()
				self.ListingUser:setAlpha( 0 )
				ListingUserFrame2( ListingUser, {} )
				local Listing2Frame2 = function ( Listing2, event )
					local Listing2Frame3 = function ( Listing2, event )
						if not event.interrupted then
							Listing2:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Bounce )
						end
						Listing2:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Listing2, event )
						else
							Listing2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Listing2Frame3( Listing2, event )
						return 
					else
						Listing2:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						Listing2:registerEventHandler( "transition_complete_keyframe", Listing2Frame3 )
					end
				end
				
				Listing2:completeAnimation()
				self.Listing2:setAlpha( 0 )
				Listing2Frame2( Listing2, {} )
				local Listing3Frame2 = function ( Listing3, event )
					local Listing3Frame3 = function ( Listing3, event )
						if not event.interrupted then
							Listing3:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						Listing3:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Listing3, event )
						else
							Listing3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Listing3Frame3( Listing3, event )
						return 
					else
						Listing3:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						Listing3:registerEventHandler( "transition_complete_keyframe", Listing3Frame3 )
					end
				end
				
				Listing3:completeAnimation()
				self.Listing3:setAlpha( 0 )
				Listing3Frame2( Listing3, {} )
				local Listing4Frame2 = function ( Listing4, event )
					local Listing4Frame3 = function ( Listing4, event )
						if not event.interrupted then
							Listing4:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Bounce )
						end
						Listing4:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Listing4, event )
						else
							Listing4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Listing4Frame3( Listing4, event )
						return 
					else
						Listing4:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Bounce )
						Listing4:registerEventHandler( "transition_complete_keyframe", Listing4Frame3 )
					end
				end
				
				Listing4:completeAnimation()
				self.Listing4:setAlpha( 0 )
				Listing4Frame2( Listing4, {} )
			end
		},
		HudStart = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				ListingUser:completeAnimation()
				self.ListingUser:setAlpha( 1 )
				self.clipFinished( ListingUser, {} )
				Listing2:completeAnimation()
				self.Listing2:setAlpha( 1 )
				self.clipFinished( Listing2, {} )
				Listing3:completeAnimation()
				self.Listing3:setAlpha( 1 )
				self.clipFinished( Listing3, {} )
				Listing4:completeAnimation()
				self.Listing4:setAlpha( 1 )
				self.clipFinished( Listing4, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 4 )
				local ListingUserFrame2 = function ( ListingUser, event )
					if not event.interrupted then
						ListingUser:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					ListingUser:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( ListingUser, event )
					else
						ListingUser:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ListingUser:completeAnimation()
				self.ListingUser:setAlpha( 1 )
				ListingUserFrame2( ListingUser, {} )
				local Listing2Frame2 = function ( Listing2, event )
					local Listing2Frame3 = function ( Listing2, event )
						if not event.interrupted then
							Listing2:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						Listing2:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Listing2, event )
						else
							Listing2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Listing2Frame3( Listing2, event )
						return 
					else
						Listing2:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						Listing2:registerEventHandler( "transition_complete_keyframe", Listing2Frame3 )
					end
				end
				
				Listing2:completeAnimation()
				self.Listing2:setAlpha( 1 )
				Listing2Frame2( Listing2, {} )
				local Listing3Frame2 = function ( Listing3, event )
					local Listing3Frame3 = function ( Listing3, event )
						if not event.interrupted then
							Listing3:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Bounce )
						end
						Listing3:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Listing3, event )
						else
							Listing3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Listing3Frame3( Listing3, event )
						return 
					else
						Listing3:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
						Listing3:registerEventHandler( "transition_complete_keyframe", Listing3Frame3 )
					end
				end
				
				Listing3:completeAnimation()
				self.Listing3:setAlpha( 1 )
				Listing3Frame2( Listing3, {} )
				local Listing4Frame2 = function ( Listing4, event )
					local Listing4Frame3 = function ( Listing4, event )
						if not event.interrupted then
							Listing4:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Bounce )
						end
						Listing4:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Listing4, event )
						else
							Listing4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Listing4Frame3( Listing4, event )
						return 
					else
						Listing4:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
						Listing4:registerEventHandler( "transition_complete_keyframe", Listing4Frame3 )
					end
				end
				
				Listing4:completeAnimation()
				self.Listing4:setAlpha( 1 )
				Listing4Frame2( Listing4, {} )
			end
		}
	}
	ListingUser.id = "ListingUser"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ListingUser:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ListingUser:close()
		element.Listing2:close()
		element.Listing3:close()
		element.Listing4:close()
		element.ZMScrPlusPoints0:close()
		element.ZMScrPlusPoints1:close()
		element.ZMScrPlusPoints2:close()
		element.ZMScrPlusPoints3:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

