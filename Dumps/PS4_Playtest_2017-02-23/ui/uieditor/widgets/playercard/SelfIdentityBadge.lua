require( "ui.uieditor.widgets.playercard.CallingCard" )
require( "ui.uieditor.widgets.Social.Social_background" )

CoD.SelfIdentityBadge = InheritFrom( LUI.UIElement )
CoD.SelfIdentityBadge.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SelfIdentityBadge )
	self.id = "SelfIdentityBadge"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 513 )
	self:setTopBottom( 0, 0, 0, 90 )
	self.anyChildUsesUpdateState = true
	
	local CallingCardBG = CoD.Social_background.new( menu, controller )
	CallingCardBG:setLeftRight( 1, 1, -366, 0 )
	CallingCardBG:setTopBottom( 0, 0, 0, 90 )
	self:addElement( CallingCardBG )
	self.CallingCardBG = CallingCardBG
	
	local emblemBG = CoD.Social_background.new( menu, controller )
	emblemBG:setLeftRight( 1, 1, -513, -366 )
	emblemBG:setTopBottom( 0, 0, 0, 90 )
	self:addElement( emblemBG )
	self.emblemBG = emblemBG
	
	local CallingCard = CoD.CallingCard.new( menu, controller )
	CallingCard:setLeftRight( 1, 1, -366, 0 )
	CallingCard:setTopBottom( 0, 0, 0, 90 )
	CallingCard:linkToElementModel( self, nil, false, function ( model )
		CallingCard:setModel( model, controller )
	end )
	CallingCard:linkToElementModel( self, "clantag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CallingCard.SocialCallingCardSubTitle.FEListSubHeaderPanel0:setAlpha( HideIfEmptyString( modelValue ) )
		end
	end )
	CallingCard:subscribeToGlobalModel( controller, "PerController", "CallingCardsIdentity.GetPublicProfileComplete", function ( model )
		local element = CallingCard
		CallingCards_EmblemGetProfile( menu, element, controller )
	end )
	self:addElement( CallingCard )
	self.CallingCard = CallingCard
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( 1, 1, -513, -366 )
	emblem:setTopBottom( 0, 0, 0, 90 )
	emblem:linkToElementModel( self, "xuid", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			emblem:setupPlayerEmblemByXUID( modelValue )
		end
	end )
	self:addElement( emblem )
	self.emblem = emblem
	
	local Sound = LUI.UIElement.new()
	Sound:setLeftRight( 0, 0, -85, -13 )
	Sound:setTopBottom( 0, 0, -91, -19 )
	self:addElement( Sound )
	self.Sound = Sound
	
	self.resetProperties = function ()
		emblem:completeAnimation()
		CallingCard:completeAnimation()
		emblemBG:completeAnimation()
		CallingCardBG:completeAnimation()
		Sound:completeAnimation()
		emblem:setLeftRight( 1, 1, -513, -366 )
		emblem:setTopBottom( 0, 0, 0, 90 )
		emblem:setAlpha( 1 )
		CallingCard:setLeftRight( 1, 1, -366, 0 )
		CallingCard:setTopBottom( 0, 0, 0, 90 )
		CallingCard:setAlpha( 1 )
		emblemBG:setLeftRight( 1, 1, -513, -366 )
		emblemBG:setTopBottom( 0, 0, 0, 90 )
		emblemBG:setAlpha( 1 )
		CallingCardBG:setLeftRight( 1, 1, -366, 0 )
		CallingCardBG:setTopBottom( 0, 0, 0, 90 )
		CallingCardBG:setRGB( 1, 1, 1 )
		CallingCardBG:setAlpha( 1 )
		Sound:setPlaySoundDirect( false )
		Sound:playSound( "", controller )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				CallingCard:completeAnimation()
				self.clipFinished( CallingCard, {} )
			end,
			ShowBadge = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				local CallingCardBGFrame2 = function ( CallingCardBG, event )
					local CallingCardBGFrame3 = function ( CallingCardBG, event )
						local CallingCardBGFrame4 = function ( CallingCardBG, event )
							if not event.interrupted then
								CallingCardBG:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
							end
							CallingCardBG:setLeftRight( 1, 1, -366, 0 )
							CallingCardBG:setTopBottom( 0, 0, 0, 90 )
							CallingCardBG:setRGB( 1, 1, 1 )
							CallingCardBG:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( CallingCardBG, event )
							else
								CallingCardBG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							CallingCardBGFrame4( CallingCardBG, event )
							return 
						else
							CallingCardBG:beginAnimation( "keyframe", 1980, false, false, CoD.TweenType.Linear )
							CallingCardBG:registerEventHandler( "transition_complete_keyframe", CallingCardBGFrame4 )
						end
					end
					
					if event.interrupted then
						CallingCardBGFrame3( CallingCardBG, event )
						return 
					else
						CallingCardBG:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						CallingCardBG:setLeftRight( 1, 1, -366, 0 )
						CallingCardBG:setAlpha( 1 )
						CallingCardBG:registerEventHandler( "transition_complete_keyframe", CallingCardBGFrame3 )
					end
				end
				
				CallingCardBG:completeAnimation()
				self.CallingCardBG:setLeftRight( 1, 1, 639, 1005 )
				self.CallingCardBG:setTopBottom( 0, 0, 0, 90 )
				self.CallingCardBG:setRGB( 1, 1, 1 )
				self.CallingCardBG:setAlpha( 0 )
				CallingCardBGFrame2( CallingCardBG, {} )
				local emblemBGFrame2 = function ( emblemBG, event )
					local emblemBGFrame3 = function ( emblemBG, event )
						local emblemBGFrame4 = function ( emblemBG, event )
							if not event.interrupted then
								emblemBG:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
							end
							emblemBG:setLeftRight( 1, 1, -513, -366 )
							emblemBG:setTopBottom( 0, 0, 0, 90 )
							emblemBG:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( emblemBG, event )
							else
								emblemBG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							emblemBGFrame4( emblemBG, event )
							return 
						else
							emblemBG:beginAnimation( "keyframe", 1980, false, false, CoD.TweenType.Linear )
							emblemBG:registerEventHandler( "transition_complete_keyframe", emblemBGFrame4 )
						end
					end
					
					if event.interrupted then
						emblemBGFrame3( emblemBG, event )
						return 
					else
						emblemBG:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						emblemBG:setLeftRight( 1, 1, -513, -366 )
						emblemBG:setAlpha( 1 )
						emblemBG:registerEventHandler( "transition_complete_keyframe", emblemBGFrame3 )
					end
				end
				
				emblemBG:completeAnimation()
				self.emblemBG:setLeftRight( 1, 1, 492, 639 )
				self.emblemBG:setTopBottom( 0, 0, 0, 90 )
				self.emblemBG:setAlpha( 0 )
				emblemBGFrame2( emblemBG, {} )
				local CallingCardFrame2 = function ( CallingCard, event )
					local CallingCardFrame3 = function ( CallingCard, event )
						local CallingCardFrame4 = function ( CallingCard, event )
							local CallingCardFrame5 = function ( CallingCard, event )
								local CallingCardFrame6 = function ( CallingCard, event )
									local CallingCardFrame7 = function ( CallingCard, event )
										local CallingCardFrame8 = function ( CallingCard, event )
											if not event.interrupted then
												CallingCard:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
											end
											CallingCard:setLeftRight( 1, 1, -366, 0 )
											CallingCard:setTopBottom( 0, 0, 0, 90 )
											CallingCard:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( CallingCard, event )
											else
												CallingCard:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											CallingCardFrame8( CallingCard, event )
											return 
										else
											CallingCard:beginAnimation( "keyframe", 1840, false, false, CoD.TweenType.Linear )
											CallingCard:registerEventHandler( "transition_complete_keyframe", CallingCardFrame8 )
										end
									end
									
									if event.interrupted then
										CallingCardFrame7( CallingCard, event )
										return 
									else
										CallingCard:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										CallingCard:setAlpha( 1 )
										CallingCard:registerEventHandler( "transition_complete_keyframe", CallingCardFrame7 )
									end
								end
								
								if event.interrupted then
									CallingCardFrame6( CallingCard, event )
									return 
								else
									CallingCard:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									CallingCard:setAlpha( 0.5 )
									CallingCard:registerEventHandler( "transition_complete_keyframe", CallingCardFrame6 )
								end
							end
							
							if event.interrupted then
								CallingCardFrame5( CallingCard, event )
								return 
							else
								CallingCard:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								CallingCard:setAlpha( 1 )
								CallingCard:registerEventHandler( "transition_complete_keyframe", CallingCardFrame5 )
							end
						end
						
						if event.interrupted then
							CallingCardFrame4( CallingCard, event )
							return 
						else
							CallingCard:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							CallingCard:setAlpha( 0.5 )
							CallingCard:registerEventHandler( "transition_complete_keyframe", CallingCardFrame4 )
						end
					end
					
					if event.interrupted then
						CallingCardFrame3( CallingCard, event )
						return 
					else
						CallingCard:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						CallingCard:setLeftRight( 1, 1, -366, 0 )
						CallingCard:setAlpha( 1 )
						CallingCard:registerEventHandler( "transition_complete_keyframe", CallingCardFrame3 )
					end
				end
				
				CallingCard:completeAnimation()
				self.CallingCard:setLeftRight( 1, 1, 639, 1005 )
				self.CallingCard:setTopBottom( 0, 0, 0, 90 )
				self.CallingCard:setAlpha( 0 )
				CallingCardFrame2( CallingCard, {} )
				local emblemFrame2 = function ( emblem, event )
					local emblemFrame3 = function ( emblem, event )
						local emblemFrame4 = function ( emblem, event )
							local emblemFrame5 = function ( emblem, event )
								local emblemFrame6 = function ( emblem, event )
									local emblemFrame7 = function ( emblem, event )
										local emblemFrame8 = function ( emblem, event )
											if not event.interrupted then
												emblem:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Linear )
											end
											emblem:setLeftRight( 1, 1, -513, -366 )
											emblem:setTopBottom( 0, 0, 0, 90 )
											emblem:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( emblem, event )
											else
												emblem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											emblemFrame8( emblem, event )
											return 
										else
											emblem:beginAnimation( "keyframe", 1840, false, false, CoD.TweenType.Linear )
											emblem:registerEventHandler( "transition_complete_keyframe", emblemFrame8 )
										end
									end
									
									if event.interrupted then
										emblemFrame7( emblem, event )
										return 
									else
										emblem:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										emblem:setAlpha( 1 )
										emblem:registerEventHandler( "transition_complete_keyframe", emblemFrame7 )
									end
								end
								
								if event.interrupted then
									emblemFrame6( emblem, event )
									return 
								else
									emblem:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									emblem:setAlpha( 0.5 )
									emblem:registerEventHandler( "transition_complete_keyframe", emblemFrame6 )
								end
							end
							
							if event.interrupted then
								emblemFrame5( emblem, event )
								return 
							else
								emblem:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								emblem:setAlpha( 1 )
								emblem:registerEventHandler( "transition_complete_keyframe", emblemFrame5 )
							end
						end
						
						if event.interrupted then
							emblemFrame4( emblem, event )
							return 
						else
							emblem:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
							emblem:setAlpha( 0.5 )
							emblem:registerEventHandler( "transition_complete_keyframe", emblemFrame4 )
						end
					end
					
					if event.interrupted then
						emblemFrame3( emblem, event )
						return 
					else
						emblem:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						emblem:setLeftRight( 1, 1, -513, -366 )
						emblem:setAlpha( 1 )
						emblem:registerEventHandler( "transition_complete_keyframe", emblemFrame3 )
					end
				end
				
				emblem:completeAnimation()
				self.emblem:setLeftRight( 1, 1, 492, 639 )
				self.emblem:setTopBottom( 0, 0, 0, 90 )
				self.emblem:setAlpha( 0 )
				emblemFrame2( emblem, {} )
				Sound:completeAnimation()
				self.Sound:setPlaySoundDirect( true )
				self.Sound:playSound( "uin_bm_slideout", controller )
				self.clipFinished( Sound, {} )
			end,
			Hide = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				CallingCardBG:completeAnimation()
				self.CallingCardBG:setAlpha( 0 )
				self.clipFinished( CallingCardBG, {} )
				emblemBG:completeAnimation()
				self.emblemBG:setAlpha( 0 )
				self.clipFinished( emblemBG, {} )
				CallingCard:completeAnimation()
				self.CallingCard:setAlpha( 0 )
				self.clipFinished( CallingCard, {} )
				emblem:completeAnimation()
				self.emblem:setAlpha( 0 )
				self.clipFinished( emblem, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				CallingCardBG:completeAnimation()
				self.CallingCardBG:setAlpha( 0 )
				self.clipFinished( CallingCardBG, {} )
				emblemBG:completeAnimation()
				self.emblemBG:setAlpha( 0 )
				self.clipFinished( emblemBG, {} )
				CallingCard:completeAnimation()
				self.CallingCard:setAlpha( 0 )
				self.clipFinished( CallingCard, {} )
				emblem:completeAnimation()
				self.emblem:setAlpha( 0 )
				self.clipFinished( emblem, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsIntDvarNonZero( "mp_prototype" )
			end
		}
	} )
	CallingCard.id = "CallingCard"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CallingCardBG:close()
		self.emblemBG:close()
		self.CallingCard:close()
		self.emblem:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

